class Question < ApplicationRecord
 belongs_to :user
 has_many :comments, as: :commentable
 has_many :answers, dependent: :destroy
 validates :title, presence: true, length: { maximum: 50 }
 validates :content, presence: true
end
