class Web::SessionsController < Web::ApplicationController
  def new
  	@session = Session.new
  end

  def destroy
    # Remove the user id from the session
    #@_current_user = session[:user_id] = nil
    sign_out
    redirect_to root_url
  end

  def create
    if user = User.find_by(params[:email]).authenticate(params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:user_id] = user.id
      redirect_to root_url
    end
  end
end
