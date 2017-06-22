# == Schema Information
#
# Table name: schools
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  headmaster_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class School < ActiveRecord::Base
  belongs_to :headmaster,
    primary_key: :id,
    foreign_key: :headmaster_id,
    class_name: :Wizard
  #
  has_many :residents,
    primary_key: :id,
    foreign_key: :school_id,
    class_name: :Wizard
  #
  # has_many :residents,
  #   through: :,
  #   source: :
end
