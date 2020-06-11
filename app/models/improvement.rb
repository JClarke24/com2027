class Improvement < ApplicationRecord
  belongs_to :student
  belongs_to :tutor

  scope :tutor_improvements, ->(tutor) { where(['tutor_id= ?', tutor.id])}
  scope :student_improvements, ->(student) { where(['student_id= ?', student.id]) }


  
end
