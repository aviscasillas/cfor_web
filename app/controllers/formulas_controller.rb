class FormulasController < ApplicationController
	before_filter :authenticate_user!, :only => [:edit, :new]

	def new
		@user = get_user(params[:user_id])
    @formula = Formula.new(params[:formula])
	end

	def edit
	end

	def show
		@formula = get_formula(params[:id])
	end

	def calculate
		@formula = get_formula(params[:id])
		@response = {:formula => @formula, :result => 55} # Here goes the formulas calculation engine call

		respond_to do |format|
		  format.html # show.html.erb
		  format.xml  { render :xml => @response }
		  format.json { render :json => @response }
		end
	end

	def create
		@user = get_user(params[:user_id])
		@formula = Formula.new(params[:formula])
    @user.formulas << @formula
    redirect_to formulas_url(@user)
	end

	def update
	end

	def destroy
	end

	private

  def get_user(user_id)
    User.find(user_id)
  end

  def get_formula(formula_id)
    Formula.find(formula_id)
  end

end
