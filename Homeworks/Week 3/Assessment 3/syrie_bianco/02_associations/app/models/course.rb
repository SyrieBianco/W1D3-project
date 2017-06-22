# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :string(255)
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ActiveRecord::Base

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :Wizard
  #
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :CourseEnrollment
  #
  has_many :students,
    through: :enrollments,
    source: :student

  has_one :school,
    through: :instructor,
    source: :school
end
