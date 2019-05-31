class Tag < ApplicationRecord
  has_and_belongs_to_many :questions, optinal: true

  validates :content, presence: true
end
