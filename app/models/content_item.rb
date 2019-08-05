class ContentItem < ApplicationRecord
  scope :filter_deleted, -> { where('trashed = ? OR trashed IS NULL', false) }
  scope :trashed_items, -> { where('trashed = ?', true) }
end
