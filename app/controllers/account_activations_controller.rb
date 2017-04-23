class AccountActivationsController < ApplicationController


  def edit
    user = User.find_by(email: params[:email]) #Finds user by email
    # Checks if the user is not activated and is authenticated
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      # activates the user and updates the time which the user was activated at
      user.activate
      user.update_attribute(:activated_at, Time.zone.now)
      # Clearly states that the user is logged in
      log_in user
      flash[:success] = "Account activated!" # Self explaintory
      redirect_to user
    else
      # Now here if user was not activated goes back to main hand n hand page
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
