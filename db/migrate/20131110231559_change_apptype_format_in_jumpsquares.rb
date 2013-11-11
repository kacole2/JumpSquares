class ChangeApptypeFormatInJumpsquares < ActiveRecord::Migration
  def change
    change_column :jumpsquares, :apptype, :integer
  end
end
