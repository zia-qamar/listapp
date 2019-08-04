class ListItem < ApplicationRecord
  belongs_to :list
  scope :not_trashed, -> {where(trashed: false)}
  scope :trashed, -> {where(trashed: true)}
end
