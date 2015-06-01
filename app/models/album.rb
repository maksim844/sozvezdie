class Album < ActiveRecord::Base
  #attr_accessible :title, :photo_file_name, :photo

  belongs_to :node
  has_many :photos, dependent: :destroy
  has_attached_file :photo,
                    :styles => { :medium => "300x300>", :thumb => "80x80>" },
                    :default_url => "/images/:style/missing.png",
                    :url => "/system/:class/:basename.:extension",
                    :hash_secret => "shortSecretString"

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  accepts_nested_attributes_for :photos

  default_scope order('id desc')

end
