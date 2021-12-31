class LikesController < ApplicationController
    before_action :authenticate_account!
    protect_from_forgery except: :save_like
    
    def save_like
        @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
        @post_id = params[:post_id]

            respond_to do |format|
                format.js{
                    if Like.where(post_id: params[:post_id], account_id: current_account.id).any?
                        #if there is already a like with the associated post_id and account_id return false
                        Like.where(post_id: params[:post_id], account_id: current_account.id).destroy_all
                        
                    elsif @like.save
                        @success = true  #useless code?
                    else
                        @success = false #useless code?
                    end

                    @post_likes = Post.find(@post_id).total_likes_count
                }
        end
    end
end
