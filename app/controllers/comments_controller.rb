class CommentsController < ApplicationController
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    end
  
  end


  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
      respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    end
  end

    private
      def comment_params
        params.require(:comment).permit(:content, :micropost_id, :user_id)
      end

end
