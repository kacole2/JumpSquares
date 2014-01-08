class CreateNmapfiles < ActiveRecord::Migration
  def change
    create_table :nmapfiles do |t|
      t.string :nmapfilename
      t.integer :nmapfilerecords
      t.integer :nmapfilematches

      t.timestamps
    end
  end
end
