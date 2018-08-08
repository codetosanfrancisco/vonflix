require 'rails_helper'

RSpec.feature "UserSignsUps", type: :feature do
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
      
      expect(page).to have_content("Oops, couldn't create account. Please make sure you are using a valid email and password and try again.")
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
      
      expect(page).to have_content("Oops, couldn't create account. Please make sure you are using a valid email and password and try again.")
      expect(page).to have_content("Lastname can't be blank")
      expect(page).to have_content("Email can't be blank")
  end
end
