require 'spec_helper'

describe FormulasController do
	
	describe "GET#show" do
		before :each do
			@user = FactoryGirl.create(:user)
			@formula = FactoryGirl.create(:formula)
			get :show, user_id: @user, id: @formula
		end
		it "assigns the requested formula to @formula" do
			assigns(:formula).should eq(@formula)
		end
		it "renders the :show template" do
    	response.should render_template :show
		end	
	end

	describe "GET#new" do
		it "assigns a new Formula to @formula"
		it "render the :new template"
	end

	describe "POST#create" do
		context "with valid attributes" do
			it "saves the new formula in the database"
			it "redirects to the formulas path"
		end
		context "with invalid attributes" do
			it "does not save the new formula in the database"
			it "re-renders the :new template"
		end
	end

end
