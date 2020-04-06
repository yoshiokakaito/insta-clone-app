class StaticPagesController < ApplicationController
  
  def home
     if logged_in?
       @micropost  = current_user.microposts.build
       @feed_items = current_user.feed.paginate(page: params[:page])
       @comment = Comment.new
       @comments = @micropost.comments
     else
       redirect_to login_url
     end
  end

  def help
  end

  def about
  end
  
end
