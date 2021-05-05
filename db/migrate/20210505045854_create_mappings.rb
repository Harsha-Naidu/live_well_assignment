# rails g model mapping team:references member:references

class CreateMappings < ActiveRecord::Migration[6.1]
  def change
    create_table :mappings do |t|
      t.references :team, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
