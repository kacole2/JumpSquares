class AddNmapfilecreatorToNmapfiles < ActiveRecord::Migration
  def change
    add_column :nmapfiles, :nmapfilecreator, :string
  end
end
