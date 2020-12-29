class Champion < ActiveRecord::Base
    has_many :team_champions
    has_many :teams, through: :team_champions

# Api.load_data

# def self.hash_champs
# Champion.all.collect do |champ|
#       champ.attributes
#      end
#  end
end