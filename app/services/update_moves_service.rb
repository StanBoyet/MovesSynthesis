class UpdateMovesService < Aldous::Service
  attr_reader :moves, :current_user

  def initialize(hash)
    @current_user = hash[:current_user]
  end

  def perform
    days = Moves::Client.new(current_user.access_token).daily_places(:pastDays => 2)
    days.each do |day|
      create_segments_for_the_day(day)
    end
    Result::Success.new
  end

  private

  def create_segments_for_the_day(day)
    day['segments'].each do |segment|
      place = create_new_place(segment['place'])
      start_time = segment['startTime'].to_datetime
      unless place.segments.where(start_time: start_time).any?
        place.segments.create(
            start_time: segment['startTime'],
            end_time: segment['endTime'],
            last_update: segment['lastUpdate']
        )
      end
    end
  end

  def create_new_place(place_attributes)
    Moves::Place.where(moves_id: place_attributes['id']).first_or_create do |place|
      place.name = place_attributes['name']
      place.place_type = place_attributes['type']
      place.location_lat = place_attributes['location']['lat']
      place.location_lon = place_attributes['location']['lon']
      provider_name = provider_id(place_attributes['type'])
      place.provider_id = place_attributes[provider_name] if provider_name
      place.user = current_user
    end
  end

  def provider_id(provider)
    if provider == 'foursquare'
      'foursquareId'
    elsif provider == 'facebook'
      'facebookPlaceId'
    end
  end

end
