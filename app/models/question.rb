class Question < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers, dependent: :destroy
  has_many :votes, as: :voteable
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
end
