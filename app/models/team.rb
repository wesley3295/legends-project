class Team < ActiveRecord::Base
    validates_presence_of :team_name
    has_many :champions
    belongs_to :user
end
