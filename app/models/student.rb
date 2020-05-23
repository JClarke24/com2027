class Student < ApplicationRecord

  mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

belongs_to :Tutor, optional: true
has_many :meetings
validates :email, :forename, :surname, presence: true
end
