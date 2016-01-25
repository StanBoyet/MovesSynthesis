class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :last_update
      t.references :place, index: true, foreign_key: true
    end
  end
end
