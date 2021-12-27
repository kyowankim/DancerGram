class PublicController < ApplicationController

    def homepage
        
    end

    def fullname 
        current_account.last_name
    end
end
