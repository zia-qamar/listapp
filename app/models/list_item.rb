class ListItem < ContentItem
  belongs_to :list, class_name: 'ContentItem', foreign_key: 'parent_id'
end
