class User < ActiveRecord::Base
  has_many :teams
  has_many :leagues, through: :teams
  mount_uploader :profile_photo, ProfilePhotoUploader

  validates :user_name, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
