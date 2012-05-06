class WelcomeController < ApplicationController
  skip_before_filter :login_required, :only => [:index, :generate]
  def index
	redirect_to login_path unless current_user
  end

  def generate
	@articles = Article.all
  end
end
