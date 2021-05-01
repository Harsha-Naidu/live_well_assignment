# rails g model team name:string home_town:string formed:integer active:boolean

class Team < ApplicationRecord
    validates :name, presence: {message: 'must be provided'}
    validates :home_town , presence: true
    validates :formed, presence: true
    validates :active, presence: {message: 'must be provided'}

    has_many :members, dependent: :destroy
end
