class Post < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, :body, presence: true
  	
  belongs_to :user

  delegate :username, to: :user

  def all_tags=(names)
  	self.tags = names.split(",").map do |name|
  		Tag.where(name: name).first_or_create!
  	end
  end
   
   def all_tags
    tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
  	Tag.find_by!(name: name).posts
  end

end
