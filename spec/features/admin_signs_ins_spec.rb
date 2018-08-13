require 'rails_helper'

RSpec.feature "AdminSignsIns", type: :feature do
  before do
      @user = User.new(firstname:"James",lastname:"Mahathir",email:"james@gmail.com",password:"password",password_confirmation:"password")
      @user.role = 1
      @user.save
      @movie = Movie.create(title:"vxvxgvfdxgvf",description:"fefewfewsfesf",video: 'video.mp4',images:['favicon.png'])
  end
  
  scenario "admin able to sign in to admin dashboard" do
      visit "/"
      
      click_link "Sign in"
      fill_in "Email",with:"james@gmail.com"
      fill_in "Password",with:"password"
      click_button "Sign in"
      
      expect(current_path).to eq admin_dashboard_path
      expect(page).to have_link("New Movie")
  end
end
