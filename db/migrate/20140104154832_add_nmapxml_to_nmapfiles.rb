class AddNmapxmlToNmapfiles < ActiveRecord::Migration
  def change
    add_column :nmapfiles, :nmapxml, :string
  end
end
