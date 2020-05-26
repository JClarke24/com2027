class Quiz < ApplicationRecord
  belongs_to :tutor

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :tutor_id, presence: true # Make sure the owner's name is present.

  scope :tutor_quizzes, ->(tutor) { where(['tutor_id= ?', tutor.id])}
end
