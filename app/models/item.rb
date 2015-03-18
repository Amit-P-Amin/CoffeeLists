class Item < ActiveRecord::Base

  belongs_to :parent, class_name: 'Item', :foreign_key => 'parent_id'
  has_many :children, class_name: 'Item', :foreign_key => 'parent_id'

  accepts_nested_attributes_for :children

  scope :root, -> {
    where(parent_id: nil)
  }

  def self.build_branch(items)
    nodes = []

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
    if children.length > 0
      item["items"] = Item.build_branch(children)
    end

    item
  end

end
