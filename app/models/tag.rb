class Tag < ApplicationRecord
  has_and_belongs_to_many :questions

  validates :content, presence: true
end
