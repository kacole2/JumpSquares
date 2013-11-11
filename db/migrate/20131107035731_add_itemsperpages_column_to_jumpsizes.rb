class AddItemsperpagesColumnToJumpsizes < ActiveRecord::Migration
  def change
    add_column :jumpsizes, :itemsperpage, :integer
  end
end
