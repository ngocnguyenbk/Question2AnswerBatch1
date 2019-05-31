class Question < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :answers, dependent: :destroy
  has_many :votes, as: :voteable
  has_and_belongs_to_many :tags, optional: true
  accepts_nested_attributes_for :tags, allow_destroy: true, :reject_if => :all_blank
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
end
