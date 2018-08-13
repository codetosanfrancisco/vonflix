require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "movie must have all field filled in" do
      context "A movie without a title is not allowed" do
          before do
              @movie = Movie.create(title:"",description:"ufiedjhf")
          end
          it "is not added to database" do
              expect(Movie.all.size).to eq 0
          end
      end
      
      context "A movie without a description is not allowed" do
          before do
              @movie = Movie.create(title:"vxvxgvfdxgvf",description:"")
          end
          it "is not added to database" do
              expect(Movie.all.size).to eq 0
          end
      end
      
      context "A movie without a video is not allowed" do
          before do
              @movie = Movie.create(title:"vxvxgvfdxgvf",description:"fefewfewsfesf",video:nil)
          end
          it "is not added to database" do
              expect(Movie.all.size).to eq 0
          end
      end
      
      context "A movie without a poster is not allowed" do
          before do
              @file = fixture_file_upload('video.mp4', 'video/mp4')
              @movie = Movie.create(title:"vxvxgvfdxgvf",description:"fefewfewsfesf",video:@file,images:nil)
          end
          it "is not added to database" do
              expect(Movie.all.size).to eq 0
          end
      end
  end
end
