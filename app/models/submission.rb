class Submission < ApplicationRecord
  belongs_to :student
  belongs_to :tutor

  mount_uploader :attachment2, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :description, presence: true # Make sure the owner's name is present.


  scope :tutor_submissions, ->(tutor) { where(['tutor_id= ?', tutor.id])}
  scope :student_submissions, ->(student) { where(['student_id= ?', student.id]) || where(['description= ?', student.surname])}

end
