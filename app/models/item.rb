class Item < ActiveRecord::Base

  belongs_to :parent, class_name: 'Item', :foreign_key => 'parent_id'
  has_many :children, class_name: 'Item', :foreign_key => 'parent_id'

  accepts_nested_attributes_for :children

  scope :root, -> {
    where(parent_id: nil)
  }

  def self.build_branch(items)
    nodes = []
    items = items.sort { |a, b| a.position <=> b.position }

    items.each do |item|
      nodes << item.build_node
    end

    nodes
  end

  def build_node
    item = {}
    item["id"] = id
    item["title"] = title
    item["content"] = content
    item["position"] = position
    item["parent_id"] = parent_id
    if children.length > 0
      item["items"] = Item.build_branch(children)
    end

    item
  end

  def swap_position(prior_item)
    siblings = get_siblings
    shiftPoint = prior_item.position
    siblings.each do |sibling|
      sibling.position -= 1 if sibling.position <= shiftPoint
      sibling.save
    end

    self.position = shiftPoint
    self.save
  end

  def swap_list(prior_item)
    self.parent_id = prior_item.parent_id
    self.swap_position(prior_item)
  end

  def get_siblings
    items = Item.all
    items.select{ |item| item.parent_id == self.parent_id}
  end

end
