class GamesController < ApplicationController
  respond_to :html, :json

  def index
    count = params[:count] || 5
    @games = Game.last(count.to_i).reverse
    respond_with({:games => @games})
  end

  def create
    game = case params[:game_type]
    when 'Individual'
      Game.parse(params[:result])
    when 'Team'
      TeamGame.parse(params[:result])
    end

    if game && game.save
      redirect_to root_path, :notice => t(:valid_game)
    else
      redirect_to root_path, :alert => t(:invalid_game)
    end
  end

  def destroy
    game = Game.find params[:id]
    game.destroy

    redirect_to root_path, :notice => t(:game_destroyed)
  end
end
