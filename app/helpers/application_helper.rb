module ApplicationHelper
    def check_active(postID)
        if Like.where(post_id: postID, account_id: current_account.id).any?
            "active"
        else
            
        end 
    end 



end
