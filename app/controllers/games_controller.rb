class GamesController < ApplicationController

  def index
    @games = Game.all
    render :json => @games.as_json(:only => [:id, :state])
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  def create
    @game = Game.create(state: params[:game][:state])
    render json: @game
  end

  def update
    @game = Game.find_by(id: params[:id])
    @game.state = params[:game][:state]
    @game.save
    render json: @game
  end

  def games_params
    params.require(:games).permit(:id)
  end

end
