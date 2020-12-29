class ChampionsController < ApplicationController

    get '/champions/:id' do
        find_champ_by_id
       
        @stats = @champ.attributes.except("Name", "Title","id","ChampionId")
       @img_name = @champ.Name.gsub(" ","").downcase
        erb :'champions/show'
      end

      private
      def find_champ_by_id
        @champ = Champion.find_by_id(params[:id])
      end
end
