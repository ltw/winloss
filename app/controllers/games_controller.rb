class GamesController < ApplicationController
  def index
  end

  def create
    game = Game.parse(params[:result])
    if game.save
      redirect_to games_path, :notice => t(:valid_game)
    else
      render :index, :alert => t(:invalid_game)
    end
  end
end
