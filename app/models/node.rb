class Node < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  has_ancestry

  has_many :teachers
  has_many :albums
  has_many :articles
  has_many :news
  attr_accessible :ancestry, :name, :position, :content, :url, :description, :keywords

  #default_scope where("in_site_map = 1 or content_producer like '%Main%'")

  def name
    "#{c_name(id)} | #{ c_section(ancestry) if ancestry.to_i > 0}"
  end
  def name2
    c_name(self.id)
  end

  def c_name(id)
    Node.where(id: id).to_a.first["name"]
  end

  def c_section(id)
    Node.where(id: id).to_a.first["name"]
  end

end
