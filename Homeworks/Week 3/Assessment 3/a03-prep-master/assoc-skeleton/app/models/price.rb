# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  company_id :integer
#  open       :float
#  high       :float
#  low        :float
#  close      :float
#  price_date :date
#  created_at :datetime
#  updated_at :datetime
#

class Price < ActiveRecord::Base

  # has a company (FAILED - 13)

  belongs_to :company,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: :Company


end
