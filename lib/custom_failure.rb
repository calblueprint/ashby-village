class CustomFailure < Devise::FailureApp
  def redirect_url
     new_user_session_url(:subdomain => 'secure')
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      flash[:error] = "Incorrect Email or Password"
      redirect_to root_path
    end
  end
end
