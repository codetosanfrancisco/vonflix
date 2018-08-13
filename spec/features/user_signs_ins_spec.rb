require 'rails_helper'

RSpec.feature "UserSignsIns", type: :feature do
  before do
      @user = User.new(firstname:"James",lastname:"Mahathir",email:"james@gmail.com",password:"password",password_confirmation:"password")
      @user.save
      @movie = Movie.create(title:"vxvxgvfdxgvf",description:"fefewfewsfesf",video:'video', images: ['image'])
  end
  scenario "a signed-up user can sign in successfully" do
      visit root_path
      
      click_link "Sign in"
      fill_in "Email",with:"james@gmail.com"
      fill_in "Password",with:"password"
      click_button "Sign in"
      
      expect(current_path).to eq user_dashboard_path
      expect(page).to have_content("You have successfully signed in.")
      
  end
  
  scenario "a non-signed-up user can't sign in successfully" do
      visit root_path
      
      click_link "Sign in"
      fill_in "Email",with:"james@gmail.com"
      fill_in "Password",with:"effesffseg"
      click_button "Sign in"
      
      expect(current_path).to eq "/signin"
      expect(page).to have_content("Incorrect email or password, try again.")
      
  end
end
