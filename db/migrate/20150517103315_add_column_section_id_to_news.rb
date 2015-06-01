class AddColumnSectionIdToNews < ActiveRecord::Migration
  def change
    add_column :news, :node_id, :integer
  end
end
