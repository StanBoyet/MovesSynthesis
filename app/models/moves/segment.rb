module Moves
  class Segment < ActiveRecord::Base

    belongs_to :place, class_name: Moves::Place.name
    
  end
end
