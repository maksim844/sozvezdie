class Teacher < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :node
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "200x200>" },
                    :default_url => "/images/:style/missing.png",
                    :url => "/system/:class/:style/:basename.:extension"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  default_scope order('id desc')

end
