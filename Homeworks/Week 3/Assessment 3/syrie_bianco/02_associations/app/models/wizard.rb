# reports to one house master (FAILED - 5)
# reports to one headmaster (FAILED - 6)
# chooses the wand (despite what the books say) (FAILED - 7)
# and successfully enroll (FAILED - 8)
# and add the course to their list (FAILED - 9)
# and learn from their instructor (FAILED - 10)
#

class Wizard < ActiveRecord::Base
  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House

  belongs_to :school,
    primary_key: :id,
    foreign_key: :school_id,
    class_name: :School

  has_one :house_master,
    through: :house,
    source: :master

  has_one :headmaster,
    through: :school,
    source: :headmaster

  has_one :wand,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :Wand

  has_many :course_enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :CourseEnrollment

  has_many :courses,
    through: :course_enrollments,
    source: :course

  has_many :instructors,
    through: :courses,
    source: :instructor

  has_many :taught_courses,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :Course

  has_many :students,
    through: :taught_courses,
    source: :students

  # has_many :,
  #   primary_key: :id,
  #   foreign_key: :,
  #   class_name: :
  #
  # has_many :,

end
