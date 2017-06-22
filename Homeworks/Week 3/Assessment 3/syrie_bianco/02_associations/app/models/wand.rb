# == Schema Information
#
# Table name: wands
#
#  id              :integer          not null, primary key
#  core_ingredient :string(255)
#  owner_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Wand < ActiveRecord::Base
  belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :Wizard
  #
  # has_many :,
  #   primary_key: :id,
  #   foreign_key: :,
  #   class_name: :
  #
  # has_many :,
  #   through: :,
  #   source: :
end
