class Article < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :node
  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "162x162>" },
                    :default_url => "/images/:style/missing.png",
                    :url => "/system/:class/:style/:basename.:extension",
                    :hash_secret => "shortSecretString"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  default_scope order('id desc')


end
