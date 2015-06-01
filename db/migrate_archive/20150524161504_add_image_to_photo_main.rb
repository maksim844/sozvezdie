class AddImageToPhotoMain < ActiveRecord::Migration
  def self.up
    add_column :photomains, :image_file_name, :string
    add_column :photomains, :image_content_type, :string
    add_column :photomains, :image_file_size, :integer
    add_column :photomains, :image_updated_at, :datetime
  end

  def self.down
    remove_column :photomains, :image_file_name
    remove_column :photomains, :image_content_type
    remove_column :photomains, :image_file_size
    remove_column :photomains, :image_updated_at
  end
end
