require 'rails_helper'

RSpec.feature "UserSignsUps", type: :feature do
  before do
    @movie = Movie.create(title:"vxvxgvfdxgvf",description:"fefewfewsfesf",video: 'video.mp4',images:['favicon.png'])
  end
  scenario "user signs up with valid credential" do
      visit root_path
      
      click_link "Join for free!"
      fill_in "Firstname",with:"Mahathir"
      fill_in "Lastname",with:"Mohamad"
      fill_in "Email",with:"mahathir@gmail.com"
      fill_in "Password",with:"password"
      fill_in "Password confirmation",with:"password"
      
      click_button "Sign up"
      
      expect(page).to have_content("Mahathir Mohamad")
      expect(page).to have_content("You have signed up successfully.")
      expect(User.first.password).not_to eq("password")
  end
  
  scenario "password and password confirmation not the same" do
      visit root_path
      
      click_link "Join for free!"
      fill_in "Firstname",with:"Mahathir"
      fill_in "Lastname",with:"Mohamad"
      fill_in "Email",with:"mahathir@gmail.com"
      fill_in "Password",with:"password"
      fill_in "Password confirmation",with:"pas"
      
      click_button "Sign up"
      
      expect(page).to have_content("error")
      expect(page).to have_content("prevent")
  end
  
  scenario "password and password confirmation not the same" do
      visit root_path
      
      click_link "Join for free!"
      fill_in "Firstname",with:"Mahathir"
      fill_in "Lastname",with:""
      fill_in "Email",with:""
      fill_in "Password",with:"password"
      fill_in "Password confirmation",with:"password"
      
      click_button "Sign up"
      
      expect(page).to have_content("Lastname can't be blank")
      expect(page).to have_content("Email can't be blank")
  end
end
