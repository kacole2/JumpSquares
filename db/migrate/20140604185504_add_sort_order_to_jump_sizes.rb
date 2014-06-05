class AddSortOrderToJumpSizes < ActiveRecord::Migration
  def change
    add_column :jumpsizes, :sortorder, :string
  end
end
