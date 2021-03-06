class TeamsController < ApplicationController

    get '/teams' do
        @teams = Team.all
        @team = Team.find_by_id(session[:team_id])
        erb :'/teams/index'
    end

    get '/teams/new' do
        erb :'/teams/new'
    end

    get '/teams/:id/edit' do
        find_team
        redirect_if_team_not_found
        erb :'teams/edit'
    end

    get '/teams/:id' do
        find_team
        session[:team_id] = @tame.id if @team
        redirect_if_team_not_found
        erb :'/teams/show'
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
        redirect_if_team_not_found
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
    
    def redirect_if_team_not_found
        redirect "/teams" unless @team
    end

end