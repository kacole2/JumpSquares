class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tagname
      t.string :tagcreator

      t.timestamps
    end
  end
end
