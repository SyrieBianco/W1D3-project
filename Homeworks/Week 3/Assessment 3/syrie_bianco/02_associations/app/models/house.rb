# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  building   :string(255)
#  master_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class House < ActiveRecord::Base
  belongs_to :master,
    primary_key: :id,
    foreign_key: :master_id,
    class_name: :Wizard
  #
  has_many :students,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :Wizard

  has_one :school,
    through: :master,
    source: :school
  # has_many :,
  #   through: :,
  #   source: :
end
