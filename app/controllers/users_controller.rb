class UsersController < ApplicationController
  respond_to :json
  def index
    count = params[:count]
    respond_with({:users => User.top_ranked((count && count.to_i))})
  end
end
