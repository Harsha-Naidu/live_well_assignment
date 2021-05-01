# rails g migration add_members_references_to_team member:references
class AddMembersReferencesToTeam < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :member, foreign_key: true
  end
end
