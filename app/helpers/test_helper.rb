module TestHelper
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user,passwore: "password", remember_me: '1' )
    session[:user_id] = user.id
    post login_path, params:{ session: { email: user.email,
					password: password,
					remember_me: remember_me}}

  end
end
