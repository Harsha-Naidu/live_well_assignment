# rails g model member name:string age:integer secret_identity:string powers:string

class Member < ApplicationRecord
    validates :name,presence: true
    validates :age,presence: true
    validates :secret_identity, presence: {message: 'should be provided'}
    validates :powers, presence: true
    
    # ASSOCIATION WITH TEAM MODEL
    belongs_to :team
end
