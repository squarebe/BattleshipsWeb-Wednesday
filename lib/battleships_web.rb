require 'sinatra/base'
require 'battleships'
require 'sinatra/session'

class BattleshipsWeb < Sinatra::Base
  # force port 3000 for Nitrous
  configure :development do
    set :bind, '0.0.0.0'
    set :port, 3000
  end

  enable :sessions

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/name_set' do
    erb :enter_name
  end

  get '/play' do
    @name = params[:name]
    erb :game
  end

  get '/start_game' do
    session[:game] = Game.new Player, Board
    session[:game].player_2.place_ship Ship.battleship, :B1, :vertically
    erb :play_game
  end

  post '/start_game' do
    @coordinates = params[:coordinates].capitalize
    erb :play_game
  end

  get '/p2p' do
    session[:game] = Game.new Player, Board
    erb :game_2
  end

  get '/p2p/place_ships' do
    @name = params[:name]
    erb :place_ships
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
