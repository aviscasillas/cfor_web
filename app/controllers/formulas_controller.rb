class FormulasController < ApplicationController
	before_filter :authenticate_user!, :only => [:edit, :new]

  before_filter :find_user
  before_filter :new_formula, :only => [:new, :create]
  before_filter :find_formula, :except => [:index, :new, :create]

	def index
		Formula.find_all_by_user_id(params[:user_id])
	end

	def new
	end

	def edit
	end

	def show
	end

	def calculate

		@response = {:formula => @formula, :result => 55} # Here goes the formulas calculation engine call

		respond_to do |format|
		  format.html # show.html.erb
		  format.xml  { render :xml => @response }
		  format.json { render :json => @response }
		end
	end

	def create
    @user.formulas << @formula
    redirect_to formulas_url(@user)
	end

	def update
	end

	def destroy
	end

	protected

  def find_user
    @user = User.find(params[:user_id])
  end

  def new_formula
    @formula = Formula.new(params[:formula])
  end

  def find_formula
    @formula = Formula.find(params[:id])
  end

end
