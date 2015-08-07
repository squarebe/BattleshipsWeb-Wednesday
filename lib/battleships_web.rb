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
  
  post '/p2p/place_ships' do
    session[:game].player_1.place_ship Ship.submarine, params[:location1].capitalize.to_sym, params[:direction1].to_sym
    session[:game].player_1.place_ship Ship.destroyer, params[:location2].capitalize.to_sym, params[:direction2].to_sym
    session[:game].player_1.place_ship Ship.cruiser, params[:location3].capitalize.to_sym, params[:direction3].to_sym
    session[:game].player_1.place_ship Ship.battleship, params[:location4].capitalize.to_sym, params[:direction4].to_sym
    session[:game].player_1.place_ship Ship.aircraft_carrier, params[:location5].capitalize.to_sym, params[:direction5].to_sym
    session[:game].player_1.place_ship Ship.submarine, params[:location6].capitalize.to_sym, params[:direction6].to_sym
    session[:game].player_1.place_ship Ship.destroyer, params[:location7].capitalize.to_sym, params[:direction7].to_sym  
    session[:game].player_1.place_ship Ship.cruiser, params[:location8].capitalize.to_sym, params[:direction8].to_sym
    session[:game].player_1.place_ship Ship.cruiser, params[:location9].capitalize.to_sym, params[:direction9].to_sym 
    erb :place_ships
  end
  
  post '/p2p/play_game2' do
    session[:game].player_2.place_ship Ship.submarine, params[:location1].capitalize.to_sym, params[:direction1].to_sym
    session[:game].player_2.place_ship Ship.destroyer, params[:location2].capitalize.to_sym, params[:direction2].to_sym
    session[:game].player_2.place_ship Ship.cruiser, params[:location3].capitalize.to_sym, params[:direction3].to_sym
    session[:game].player_2.place_ship Ship.battleship, params[:location4].capitalize.to_sym, params[:direction4].to_sym
    session[:game].player_2.place_ship Ship.aircraft_carrier, params[:location5].capitalize.to_sym, params[:direction5].to_sym
    session[:game].player_2.place_ship Ship.submarine, params[:location6].capitalize.to_sym, params[:direction6].to_sym
    session[:game].player_2.place_ship Ship.destroyer, params[:location7].capitalize.to_sym, params[:direction7].to_sym 
    session[:game].player_2.place_ship Ship.cruiser, params[:location8].capitalize.to_sym, params[:direction8].to_sym
    session[:game].player_2.place_ship Ship.cruiser, params[:location9].capitalize.to_sym, params[:direction9].to_sym  
    erb :play_game2
  end

  get '/p2p/play/p1' do
    erb :player_1
  end

  post '/p2p/play/p2' do
    @coordinates = params[:coordinates].capitalize
    erb :player_2
  end

  get '/p2p/play/p2' do
    erb :player_2
  end

  post '/p2p/play/p1' do
    @coordinates = params[:coordinates].capitalize
    erb :player_1
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
