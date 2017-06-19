class Price < ActiveRecord::Base

  # has a company (FAILED - 13)

  belongs_to :company,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: :Company


end
