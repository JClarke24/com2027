class Tutor < ApplicationRecord
  rating as: :resource
  enum approval: [:unapproved, :approved]
  after_initialize :set_default_approval, :if => :new_record?
    def set_default_approval
      self.approval ||= :approved
    end

  mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#don't delete student if tutor deletes account - but let them pick another tutor
has_many :students
validates :email, :forename, :surname, presence: true
validates :location, format: {with: /\((-{0,1})\d+(.{0,1})\d+,\s(-{0,1})\d+(.{0,1})\d+\)/, message: "invalid location format: #{:location}"}
end
