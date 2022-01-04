class CommentsController < ApplicationController
    before_action :authenticate_account!

    def create
        @comment = Comment.new(comment_params)
        @comment.account_id = current_account.id if account_signed_in?

        if @comment.save 
            flash[:success] = "Comment was successfully created"
        else 
            flash[:danger] = "Comment was not saved!"
        end
            render dashboard_path
    end

    def show
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :post_id)
    end

end
