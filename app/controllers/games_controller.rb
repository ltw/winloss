class GamesController < ApplicationController
  def index
  end

  def create
    game = case params[:game_type]
    when 'Individual'
      Game.parse(params[:result])
    when 'Team'
      TeamGame.parse(params[:result])
    end

    if game.save
      redirect_to games_path, :notice => t(:valid_game)
    else
      render :index, :alert => t(:invalid_game)
    end
  end
end
