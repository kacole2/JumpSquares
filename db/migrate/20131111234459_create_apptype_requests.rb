class CreateApptypeRequests < ActiveRecord::Migration
  def change
    create_table :apptype_requests do |t|
      t.string :appname
      t.string :imageurl
      t.string :apprequestor
      t.boolean :completed

      t.timestamps
    end
  end
end
