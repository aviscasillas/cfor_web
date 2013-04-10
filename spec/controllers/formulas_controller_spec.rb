require 'spec_helper'

describe FormulasController do
	include Devise::TestHelpers

	before :all do
		@user = FactoryGirl.create(:user)
	end

	describe "GET#show" do
		before :each do
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
		before :each do
			sign_in @user
			get :new, user_id: @user
		end
		it "assigns formulas user to @user" do
			assigns(:user).should eq(@user)
		end
		it "assigns a new Formula to @formula" do
			assigns(:formula).should_not be_nil
		end
		it "render the :new template" do
			response.should render_template :new
		end 
	end

	describe "POST#create" do
		before :each do
			sign_in @user
		end
		context "with valid attributes" do
			it "saves the new formula in the database" do
				expect{
					post :create, user_id: @user, formula: FactoryGirl.attributes_for(:formula)
				}.to change(Formula, :count).by(1)
			end
			it "redirects to the new formula" do
				post :create, user_id: @user, formula: FactoryGirl.attributes_for(:formula)
				response.should redirect_to [@user, Formula.last]
			end
		end
		context "with invalid attributes" do
			it "does not save the new formula in the database" do
				expect{
					post :create, user_id: @user, formula: FactoryGirl.attributes_for(:invalid_formula)
				}.to_not change(Formula, :count)
			end
			it "re-renders the :new template" do
				post :create, user_id: @user, formula: FactoryGirl.attributes_for(:invalid_formula)
				response.should render_template :new
			end
		end
	end

end
