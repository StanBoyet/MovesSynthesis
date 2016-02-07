class ChangeFoursquareIdToProviderIdInMovesPlaces < ActiveRecord::Migration
  def change
    rename_column :places, :foursquare_id, :provider_id
  end
end
