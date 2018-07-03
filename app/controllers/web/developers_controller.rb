class Web::DevelopersController < Web::ApplicationController
  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)

    if @developer.save
      redirect_to :welcome
      sign_in @developer
    else
      render :new
#      p @developer.errors
#      p developer_params
    end
  end

  private

  def developer_params
    params.require(:developer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end