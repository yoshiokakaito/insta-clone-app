class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = '投稿が完了しました'
      redirect_to root_url
    else
      @feed_items = []
      flash.now[:danger] = '投稿に失敗しました'
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.delete
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
