class Post < ApplicationRecord
  has_many :taggins, dependent: :destroy
  has_many :tags, through: :taggins

  validates :title, :body, presence: true
  	
  belongs_to :user

  delegate :username, to: :user
end
