class List < ApplicationRecord
  has_many :list_items, dependent: :destroy
  accepts_nested_attributes_for :list_items
  scope :not_trashed, -> {where(trashed: false)}
  scope :trashed, -> {where(trashed: true)}
end
