class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy



  has_many :passive_relationships, class_name: 'Relationship',
  				foreign_key: 'followed_id', depdendent: :destroy


  has_many :followers, :passive_relationships, source: :follower

  has_many :active_relationships, class_name: 'Relationship',
  				foreign_key: 'follower_id', dependent: :destroy
  
  has_many :followings, through: :active_relationships, source: :followed				


  def follow(other_user)
  end
  
  def unfollow(other_user)
  end	 	

  validates :username, presence: true
  mount_uploader :avatar, AvatarUploader
end


