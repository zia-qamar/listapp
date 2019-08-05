class List < ContentItem
  has_many :list_items, class_name: 'ContentItem', foreign_key: 'parent_id', dependent: :destroy
end
