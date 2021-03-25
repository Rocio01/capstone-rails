module StaticPagesHelper
  def signup_btn
    link_to 'Sign up', signup_path, class: 'btn btn-lg btn-success' unless logged_in?
  end

  def login_link
    tag.h5(link_to('Log in', login_path)) unless logged_in?
  end
end
