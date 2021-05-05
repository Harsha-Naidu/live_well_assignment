class Mapping < ApplicationRecord
  belongs_to :team
  belongs_to :member

  validates :member_id, uniqueness: {scope: :team_id}
  # each member can be applied to a team once
end
