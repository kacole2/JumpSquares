class CreateJumpsquaresTags < ActiveRecord::Migration
  def change
    create_table :jumpsquares_tags do |t|
      t.integer :jumpsquare_id
      t.integer :tag_id
    end
  end
end
