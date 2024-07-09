require_relative '../spec/lib/posts.rb'
# require 'rails_helper'

RSpec.describe Posts do
  context "attributes" do
    # subject { Post.new("Title test", "Body test") } 
    let(:obj) { puts "obj created!"; described_class.new("Title test", "Body test") }
    # let(:post) { puts "post created!"; Post.new("Title test for Post", "Body test for Post", user_id: 1) }
    
    it '#created?' do
      expect(obj).to have_attributes(:title => "Title test", :body => "Body test")
    end

    # it { expect(post).to be_an_instance_of Post }
    
    it { expect(obj.my_arr).to include 2 }

    it { expect(obj.title).to eq "Title test" }
    it { expect(obj).to be_an_instance_of(described_class) }
    it { 
      @post = Posts.new("Title test", "Body test")
      expect(described_class).to eq @post.class
    }
    it ":title, :body must be strings" do
      obj.title = "Posts"
      expect(obj.title).to be_an(String)
      expect(obj.body).to be_an(String)
    end
  end
  
  context 'class Methods' do
    it '.all method which will record all instances of the class' do
      expect(Posts.all).to be_an(Array)
    end
  end
  
  # context 'create post' do
  #   subject { PostsController.new("Title test", "Body test") } 

  #   it 'create post with arguments' do
  #     expect(subject.save).to eq true
  #   end
  # end

end