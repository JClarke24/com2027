class Student < ApplicationRecord

  mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  belongs_to :Tutor, optional: true
  has_many :meetings
  validates :email, :forename, :surname, presence: true

  def self.from_omniauth(access_token)
    data = access_token.info
    student = Student.where(:email => data["email"]).first

    unless student
      student = Student.create(
        name: data["name"],
        email: data["email"],
        encrypted_password: Devise.friendly_token[0,20]
      )
    end
    student
  end
end
