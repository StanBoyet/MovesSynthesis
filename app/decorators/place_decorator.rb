class PlaceDecorator < Draper::Decorator
  delegate_all

  def markup_icon
    if place_type == 'home'
      "basic-home"
    elsif place_type == 'work'
      "basic-case"
    else
      "basic-geolocalize-01"
    end
  end


end
