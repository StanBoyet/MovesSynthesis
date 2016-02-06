class PlacesController < ApplicationController

  def index
    @places = PlaceDecorator.decorate_collection current_user.places.where('NAME IS NOT NULL')
  end

end
