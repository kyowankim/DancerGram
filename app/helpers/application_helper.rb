module ApplicationHelper
    def check_active(postID)
        if Like.where(post_id: postID, account_id: current_account.id).any?
            "active"
        else
            
        end 
    end 

    def check_profile_picture(account, width)
        image_path = account.image.present? ? account.image.thumb.url: "profile-image.jpg"
        image_tag(image_path, width: width, class: "image-circle")
    end

    def can_edit_profile?
        
    end

end
