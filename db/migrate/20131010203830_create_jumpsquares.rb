class CreateJumpsquares < ActiveRecord::Migration
  def change
    create_table :jumpsquares do |t|
      t.string :name
      t.string :apptype
      t.string :url
      t.string :ipordns
      t.text :description

      t.timestamps
    end
  end
end
