class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit]

  def show
    @user = get_user(params[:id])
    @formulas = @user.formulas
  end

  def edit
  end

  private

  def get_user(user_id)
    User.find(user_id)
  end
end
