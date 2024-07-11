require 'rails_helper'

RSpec.describe Post, type: :model do
  it "validate title?" do
    comment = Post.new(title: '', body: 'qefqwf')
    comment.valid?
    comment.errors[:title].should_not be_empty
  end

  it "validate body?" do
    comment = Post.new(title: "qw", body: '')
    comment.valid?
    comment.errors[:body].should_not be_empty
  end
end