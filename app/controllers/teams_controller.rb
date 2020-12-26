class TeamsController < ApplicationController
    get '/team/new' do
        erb :'/teams/new'
    end
end