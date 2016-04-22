class CustomFailure < Devise::FailureApp
  def redirect_url
    new_user_session_url(:subdomain => '')
  end

  # You need to override respond to eliminate recall
  def respond
    puts 'respond'
    if http_auth?
      http_auth
    else
      puts 'else'
      flash[:error] = "sign_in"
      redirect_to root_path
    end
  end
end
