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
        # binding.pry
        session[:team_id] = @team.id if @team
        redirect_if_team_not_found
        erb :'/teams/show'
      end
    

    post '/teams' do
        @team = Team.create(team_name: params[:user][:team_name], champion_ids: params[:user][:champion_ids], user_id: current_user.id)
        
        # if !params[:team][:champion_id].empty?
        # @team.champion_id << Team.create(champion_ids params[:team][:champion_id])
            redirect "/teams/#{@team.id}"
        # else
        #     redirect '/teams/new'
        # end
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