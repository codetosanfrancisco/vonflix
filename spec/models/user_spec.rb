require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user with valid credentials sign up succesfully" do
    context "valid email and password" do
       it "should be added to db user table" do
         @user1 = User.create!(firstname:"James",lastname:"Wong",email:"voon@gmail.com",password:"93332030")
         expect(User.all.size).to eq 1
       end
    end
    
    context "without password" do
      it "should not be added to db user table" do
         @user2 = User.new(firstname:"James",lastname:"Wong",email:"voono@gmail.com",password:"").save
         expect(User.all.size).to eq 0
      end
    end
    
    context "password not enough long" do
      it "should not be added to db user table" do
         @user2 = User.new(firstname:"James",lastname:"Wong",email:"voono@gmail.com",password:"1234").save
         expect(User.all.size).to eq 0
      end
    end
    
    context "same email" do
      before do
        User.create!(firstname:"James",lastname:"Wong",email:"voon@gmail.com",password:"93332030") 
      end
      it "should not be added to db user table" do
         @user2 = User.new(firstname:"James",lastname:"Wong",email:"voon@gmail.com",password:"12345678910").save
         expect(User.all.include?(@user2)).to eq false
      end
    end
  end
end
