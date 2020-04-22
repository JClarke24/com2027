class Tutor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#don't delete student if tutor deletes account - but let them pick another tutor
has_many :students
validates :email, :forename, :surname, presence: true
validates :location, format: {with: /\((-{0,1})\d+(.{0,1})\d+,\s(-{0,1})\d+(.{0,1})\d+\)/, message: "invalid location format: #{:location}"}
end
