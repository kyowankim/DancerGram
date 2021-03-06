class PostsController < ApplicationController
    before_action :authenticate_account!
    before_action :set_post, only: [:show]
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.account_id = current_account.id if account_signed_in?
        if @post.save 
            redirect_to dashboard_path, flash: { success: "Post was successfully created"}
        else 
            redirect_to new_post_path, flash: { danger: "Post was not saved!"}
        end
    end

    def show
        @posts = Post.active
        @post = Post.find(params[:post_id])
        @new_comment = Comment.new
        @comments = Comment.includes(:account).where(post_id: @post.id)
        
    end

    private

    def set_post
        @post = Post.find(params[:post_id]) if params[:post_id].present?
    end

    def post_params
        params.require(:post).permit(:image, :image_cache, :description)
    end

end
