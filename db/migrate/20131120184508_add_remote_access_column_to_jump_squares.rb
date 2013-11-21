class AddRemoteAccessColumnToJumpSquares < ActiveRecord::Migration
  def change
    add_column :jumpsquares, :remotetype, :string
  end
end
