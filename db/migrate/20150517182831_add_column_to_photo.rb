class AddColumnToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :section_id, :integer
    add_column :photos, :photo_file_name, :string
    add_column :photos, :photo_content_type, :string
    add_column :photos, :photo_file_size, :integer
    add_column :photos, :photo_updated_at, :datetime
    add_column :photos, :album_id, :integer
  end

  def self.down
    remove_column :photos, :photo_file_name
    remove_column :photos, :photo_content_type
    remove_column :photos, :photo_file_size
    remove_column :photos, :photo_updated_at
    remove_column :photos, :section_id
    remove_column :photos, :album_id
  end
end
