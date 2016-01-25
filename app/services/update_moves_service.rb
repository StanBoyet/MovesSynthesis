class UpdateMovesService < Aldous::Service
  attr_reader :moves, :current_user

  def initialize(hash)
    @current_user = hash[:current_user]
  end

  def perform

    byebug
    days = Moves::Client.new(current_user.access_token).daily_places(:pastDays => 4)
    days.each do |day|
      day['segments'].each do |segment|
        place_attr = segment['place']
        new_place = Moves::Place.where(moves_id: place_attr['id']).first_or_create do |place|
          #moves_id:integer name:string type:string location_lat:float location_lon:float foursquare_id:string user:references
          place.name = place_attr['name']
          place.place_type = place_attr['type']
          place.location_lat = place_attr['location']['lat']
          place.location_lon = place_attr['location']['lon']
          place.foursquare_id = place_attr['foursquareId']
          place.user = current_user
        end

        new_place.segments.create(start_time: segment['startTime'], end_time: segment['endTime'], last_update: segment['lastUpdate'])
      end
    end

    Result::Success.new

  end


end
