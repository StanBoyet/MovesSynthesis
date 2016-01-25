module Moves
  class Place < ActiveRecord::Base
    belongs_to :user
    has_many :segments
  end
end
