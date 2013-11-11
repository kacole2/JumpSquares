class CreateJumpsizes < ActiveRecord::Migration
  def change
    create_table :jumpsizes do |t|
      t.string :size
      t.integer :length1
      t.integer :length2

      t.timestamps
    end
  end
end
