# == Schema Information
#
# Table name: course_enrollments
#
#  id         :integer          not null, primary key
#  student_id :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CourseEnrollment < ActiveRecord::Base

  belongs_to :student,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Wizard

  belongs_to :course,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course
end
