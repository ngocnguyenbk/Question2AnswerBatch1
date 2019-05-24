class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :votes, as: :voteable
  
  validates :content, presence: true, length: { maximum: 300 }
end
