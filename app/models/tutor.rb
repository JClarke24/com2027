class Tutor < ApplicationRecord
  enum approval: [:approved, :unapproved]
  after_initialize :set_default_approval, :if => :new_record?
    def set_default_approval
      self.approval ||= :approved
    end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
