class Photomain < ActiveRecord::Base

  belongs_to :setting
  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "200x200>" },
                    :default_url => "/images/:style/missing.png",
                    :url => "/system/:class/:style/:basename.:extension"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  default_scope order('id desc')
end
