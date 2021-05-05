# rails g model team name:string home_town:string formed:integer active:boolean

class Team < ApplicationRecord
    validates :name, presence: {message: 'must be provided'}
    validates :home_town , presence: true
    validates :formed, presence: true
  
    has_many :mappings, dependent: :destroy
    has_many :members, through: :mappings
 
end
