class PagesController < ApplicationController

  def index
    if current_user
      UpdateMovesService.perform(current_user: current_user)
      moves = Moves::Client.new(current_user.access_token)
      @places = moves.daily_places(:pastDays => 4)
      filtered_places = []
      # @places.delete_if {|key, value| value.nil? }
    end
  end

end
