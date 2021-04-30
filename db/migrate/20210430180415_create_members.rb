class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :age
      t.string :secret_identity
      t.string :powers

      t.timestamps
    end
  end
end
