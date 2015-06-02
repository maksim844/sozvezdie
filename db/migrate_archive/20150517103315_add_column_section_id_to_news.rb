class AddColumnSectionIdToNews < ActiveRecord::Migration
  def change
    add_column :main, :node_id, :integer
  end
end
