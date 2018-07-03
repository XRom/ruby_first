class Web::SessionsController < Web::ApplicationController
  def new
  	@session = Session.new
  end

  def destroy
    # Remove the user id from the session
    #@_current_user = session[:user_id] = nil
    sign_out
    redirect_to new_sessions_url
  end

  def create
#  	raise foo.inspect
#  	p params[:password]
    
    if user = User.where(email: params[:session][:email]).first.authenticate(params[:session][:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      sign_in user
      redirect_to welcome_url
    else
      redirect_to new_sessions_url
    end
   # raise params[:email].inspect
  end
end
