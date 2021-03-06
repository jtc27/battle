require 'sinatra'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player_1] = params[:player_1]
    session[:player_2] = params[:player_2]
    redirect '/play'
  end

  get '/play' do
    @player_1 = session[:player_1] 
    @player_2 = session[:player_2]
    erb :play
  end

 # start the server if ruby file executed directly
 run! if app_file == $0
end