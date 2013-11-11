class CreateApptypes < ActiveRecord::Migration
  def change
    create_table :apptypes do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
