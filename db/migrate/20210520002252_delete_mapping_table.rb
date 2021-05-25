# rails g migration delete_mapping_table
class DeleteMappingTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :mappings
  end
end
