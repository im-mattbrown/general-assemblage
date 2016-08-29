module AuthHelper
  def auth_through_user
    current_user != nil && current_user.id == @user.id
  end
end
