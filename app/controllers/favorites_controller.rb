class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Micropost.find(params[:micropost_id])
    current_user.favorite(post)
    flash[:success] = '投稿をお気に入りに追加しました。'
    redirect_to root_url
  end

  def destroy
    post = Micropost.find(params[:micropost_id])
    current_user.not_favorite(post)
    flash[:success] = 'いいね！を解除しました。'
    redirect_to root_url
  end
end
