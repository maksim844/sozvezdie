class Setting < ActiveRecord::Base
  belongs_to :section

  has_many :photomains
  accepts_nested_attributes_for :photomains
end
