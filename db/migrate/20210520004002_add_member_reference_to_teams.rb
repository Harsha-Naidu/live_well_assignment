# rails g migration add_member_reference_to_teams

class AddMemberReferenceToTeams < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :members,  foreign_key: true
  end
end
