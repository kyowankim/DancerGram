class CommentsController < ApplicationController
    before_action :authenticate_account!

    def create

        @comment = Comment.new(comment_params)
        @comment.account_id = current_account.id if account_signed_in?

        if @comment.save 
            return_url = params[:comment][:return_to].present? ? show_path(@comment.post_id) : dashboard_path
            flash[:success] = "Comment was successfully created"
            redirect_to return_url
        else 
            flash[:danger] = "Comment was not saved!"
            redirect_to dashboard_path
        end
    end

    def show
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :post_id, :return_to)
    end

end
