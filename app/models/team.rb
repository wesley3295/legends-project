class Team < ActiveRecord::Base
    validates_presence_of :team_name

    belongs_to :user
end
