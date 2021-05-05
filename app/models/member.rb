# rails g model member name:string age:integer secret_identity:string powers:string

class Member < ApplicationRecord
    validates :name,presence: true
    validates :age,presence: true
    validates :secret_identity, presence: {message: 'should be provided'}
    validates :powers, presence: true
    
    has_many :mappings, dependent: :destroy
    has_many :teams, through: :mappings
end
