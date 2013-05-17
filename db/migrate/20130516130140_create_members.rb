class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      
      t.string :name, null: false
      t.integer :age, default: 0
      t.timestamps
    end
  end
end
