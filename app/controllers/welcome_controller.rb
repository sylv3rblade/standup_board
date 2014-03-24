class WelcomeController < ApplicationController

  before_filter :authenticate
  skip_before_filter :require_login

  def index

  end

  def authenticate
    redirect_to todos_path if current_user.present?
  end

end
