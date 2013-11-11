class CreateJumpsquares < ActiveRecord::Migration
  def change
    create_table :jumpsquares do |t|
      t.string :name
      t.integer :apptype
      t.string :url
      t.string :ipordns
      t.text :description
      t.string :tag
      t.string :jscreator

      t.timestamps
    end
  end
end
