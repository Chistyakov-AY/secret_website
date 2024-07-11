require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "validate body" do
    comment = Comment.new(body: '')
    comment.valid?
    comment.errors[:body].should_not be_empty
  end
end