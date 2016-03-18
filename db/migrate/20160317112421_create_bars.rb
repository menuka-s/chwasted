class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string  :name, null: false
      t.string  :address, null: false
      t.string  :phone
      t.float   :lat
      t.float   :lng
      t.string  :google_place_id
    end
  end
end
