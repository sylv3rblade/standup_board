class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    if omniauth = auth_callback
      authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
      if authentication
        auto_login(authentication.user)
        redirect_back_or_to(:users, notice: 'Login successful')
      else
        user = User.new
        user.apply_omniauth(omniauth)
        if user.save!
          auto_login(user)
          redirect_back_or_to(:users, notice: 'Login successful')
        else
          login_failed
        end
      end

    elsif user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      login_failed
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end

  def login_failed
    flash.now[:alert] = "Login failed"
    render action: "new"
  end

  private

  def user_params
    params.require(:person).permit(:name, :age)
  end

  protected

    def auth_callback
      auth = request.env['omniauth.auth']
      auth.except "extra" if auth
    end

end
