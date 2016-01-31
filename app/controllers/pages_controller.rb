class PagesController < ApplicationController

  def index
    if current_user
      # Actual data usage
      UpdateMovesService.perform(current_user: current_user)
      @places = current_user.places
    end
  end

end
