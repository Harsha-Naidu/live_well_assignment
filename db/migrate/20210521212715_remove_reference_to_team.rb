class RemoveReferenceToTeam < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :members_id

  end
end
