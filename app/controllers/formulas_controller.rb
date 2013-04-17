class FormulasController < ApplicationController
	respond_to :html, :json

	#before_filter :authenticate_user!, :only => [:new, :create]

	def show
		@user = get_user(params[:user_id])
		@formula = get_formula(params[:id])
    respond_with [@user, @formula]
	end

	def new
		@user = get_user(params[:user_id])
    @formula = Formula.new
    respond_with [@user, @formula]
	end

	def create
		@user = get_user(params[:user_id])
		@formula = Formula.new(params[:formula])
		if @formula.valid?
	 		@user.formulas << @formula
	  	respond_with([@user, @formula]) do |format|
	    	format.html {redirect_to [@user, @formula]}
	    end
	  else
	  	respond_with([@user, @formula]) do |format|
	  		format.html {render :new}
	  		format.json {render json: @formula.errors, status: 400} 
	  	end
	  end
	end

	def calculate
		@formula = get_formula(params[:id])
		@response = {:formula => @formula, :result => 55} # Here goes the formulas calculation engine call
		respond_with @response
	end

	private

  def get_user(user_id)
    User.find(user_id)
  end

  def get_formula(formula_id)
    Formula.find(formula_id)
  end

end
