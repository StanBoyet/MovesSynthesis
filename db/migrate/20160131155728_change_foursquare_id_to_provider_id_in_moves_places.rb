class ChangeFoursquareIdToProviderIdInMovesPlaces < ActiveRecord::Migration
  def change
    change_column :places, :foursquare_id, :provider_id
  end
end
