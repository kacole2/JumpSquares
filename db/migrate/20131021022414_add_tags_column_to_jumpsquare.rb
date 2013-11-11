class AddTagsColumnToJumpsquare < ActiveRecord::Migration
  def change
    add_column :jumpsquares, :tag, :string
  end
end
