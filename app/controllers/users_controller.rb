class UsersController < ApplicationController
	before_filter :authenticate_user!, :only => [:edit]

  before_filter :find_user

	def show
	end

	def edit
	end

  protected

  def find_user
    @user = User.find(params[:id])
    @formulas = @user.formulas
  end
end
