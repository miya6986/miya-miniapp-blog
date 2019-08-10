class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @articles = Article.where(user_id: current_user.id).order('id DESC')
  end

end
