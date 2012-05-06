class WelcomeController < ApplicationController
  def index
	redirect_to login_path unless current_user
  end
end
