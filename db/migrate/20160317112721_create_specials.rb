class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.integer :bar_id, null: false
      t.integer :day_id, null: false
      t.string  :deals
    end
  end
end
