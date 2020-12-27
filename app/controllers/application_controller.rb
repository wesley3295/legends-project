require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV['SESSION_SECRET']
  end

  helpers :logged_in?

  get "/" do
    erb :welcome
  end

  def logged_in?
    !!session[:user_id]
  end

end
