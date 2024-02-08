module SpecTestHelper
  include Warden::Test::Helpers

  def login(user)
    login_as user, scope: :user
    user
  end

  def current_user
    User.find(request.session[:user])
  end
end
