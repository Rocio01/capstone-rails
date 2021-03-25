module StaticPagesHelper
    def signup_btn
        unless logged_in?
            link_to "Sign up", signup_path, class: "btn btn-lg btn-success"
            
        end
    end
    def login_link
        unless logged_in?            
            tag.h5(link_to "Log in", login_path)
        end
    end    
 
end

