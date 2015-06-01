class Ball < ActiveRecord::Base
  attr_accessor :size
  validates_presence_of :color

  def to_param
    color.present? ? color.downcase.gsub(" ", "-") : id
  end
end
