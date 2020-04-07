class Tutor < ApplicationRecord
  enum approval: [:unapproved, :approved]
  after_initialize :set_default_approval, :if => :new_record?

  def set_default_approval
    self.approval ||= :unapproved
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
