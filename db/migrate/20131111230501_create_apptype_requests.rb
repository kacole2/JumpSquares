class CreateApptypeRequests < ActiveRecord::Migration
  def change
    create_table :apptype_requests do |t|

      t.timestamps
    end
  end
end
