class Section < ActiveRecord::Base
# attr_accessible :image
  has_many :photomains
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png",
                    :url => "/system/:class/:basename.:extension"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
