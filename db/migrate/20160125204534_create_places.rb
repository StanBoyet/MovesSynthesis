class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :moves_id
      t.string :name
      t.string :place_type
      t.float :location_lat
      t.float :location_lon
      t.string :foursquare_id
      t.references :user, index: true, foreign_key: true
    end
  end
end
