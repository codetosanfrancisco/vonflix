require 'rails_helper'

RSpec.feature "CreateNewMovies", type: :feature do
  before do
      @user = User.new(firstname:"James",lastname:"Mahathir",email:"james@gmail.com",password:"password",password_confirmation:"password")
      @user.role = 1
      @user.save
  end
  
  scenario "admin able to sign in to admin dashboard" do
      visit "/"
      
      click_link "Sign in"
      fill_in "Email",with:"james@gmail.com"
      fill_in "Password",with:"password"
      click_button "Sign in"
      click_link "New Movie"
      
      fill_in "Title",with:"National Treasure"
      fill_in "Year",with:"2004"
      fill_in "Age",with:"10+"
      fill_in "Hour",with:"2"
      fill_in "Minute",with:"50"
      fill_in "Director",with:"James Tony"
      fill_in "Description",with:"Tresure Hunting"
      fill_in "Number of starring",with:"2"
      fill_in "Number of cast",with:"10"
      
      click_button "Next"
      expect(current_path).to eq new_movie_path
      expect(page).to have_content "National Treasure"
      
      fill_in ..
  end
end
