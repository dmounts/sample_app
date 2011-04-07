module SessionsHelper

  def sign_in(user)
#    printf("\n Calling the sign_in method \n")
#    printf("\n The User: " + user.name + "\n")
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
#    printf("\n Getting ready to call the current_user setter \n")
    self.current_user = user
  end

  def current_user=(user)
#    printf("\n Assigning the current user: #{user.name} \n")
    @current_user = user
  end

  def current_user
#    printf("\n Calling current_user method \n")
    @current_user ||= user_from_remember_token
#    printf("\n The Current User: " + @current_user.name + "\n")
  end

  def signed_in?
#    printf("\n Calling signed_in? method \n")
#    printf("\n Are we signed in? -- #{!current_user.nil?}")
    !current_user.nil?
  end

  def sign_out
     cookies.delete(:remember_token)
     self.current_user = nil
  end

  private

    def user_from_remember_token
#      printf("\n Calling the user_from_remember_token method \n")
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
#      printf("\n Calling the remember_token method \n")
#      printf("\n The cookie: #{cookies.signed[:remember_token]} \n")
      cookies.signed[:remember_token] || [nil, nil]
    end

end
