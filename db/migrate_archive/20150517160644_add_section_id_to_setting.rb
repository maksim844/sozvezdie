class AddSectionIdToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :section_id, :integer
  end
end
