require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#comment model' do
    comment = Comment.new(body: '')
    comment.valid?
    it { expect(comment.errors[:body]).not_to be_empty }
  end
end