module TestHelper
#  def is_logged_in?
#    !page.get_rack_session_key(:user_id).nil?
#  end

#  def log_in_as(user)
#    page.get_rack_session_key(:user_id) 
#  end

  def sign_in(user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(user_id: user.id)
  end


end
