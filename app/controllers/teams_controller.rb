class TeamsController < ApplicationController
    get '/teams/new' do
        erb :'/teams/new'
    end

    get '/teams/:id' do
        @team = Team.find_by_id(params[:id])
        erb :'/teams/show'
      end
    
    get '/teams' do
        @teams = Team.all
        erb :'/teams/index'
    end

    post '/teams' do
        team = Team.new(params)
        if team.save
            redirect '/teams'
        else
            redirect '/teams/new'
        end
        
    end
end