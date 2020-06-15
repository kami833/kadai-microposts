class FavoritesController < ApplicationController
     before_action :require_user_logged_in
  
  def index
    if logged_in?
      @faovrite = current_user.favorites.build
      @favorites = current_user.feed_favorites.order(id: :desc).page(params[:page])
    end
  end

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入りしました。'
    redirect_to micropost.user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to micropost.user
  end
end
