class TeamsController < ApplicationController
    get '/teams/new' do
        erb :'/teams/new'
    end

    get '/teams/:id/edit' do
        find_team
        erb :'teams/edit'
    end

    get '/teams/:id' do
        find_team
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

    patch '/teams/:id' do
        find_team
        if @team.update(params[:team_name])
            redirect "/teams/#{@team.id}"
        else
            redirect "/teams/#{@team.id}/edit"
        end
    end

    delete '/teams/:id' do
        find_team
        if @team
            @team.destroy
            redirect "/teams"
        end
    end

    private
    def find_team
        @team = Team.find_by_id(params[:id])
    end 

end