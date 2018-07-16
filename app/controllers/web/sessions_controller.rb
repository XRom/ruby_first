class Web::SessionsController < Web::ApplicationController
  def new
  	@session = Session.new
  end

  def destroy
    sign_out
    redirect_to new_sessions_url
  end

  def create
    @session = Session.new(session_params)

    if @session.valid?
      sign_in @session.user
      redirect_to welcome_url
    else
      render :new
    end
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
