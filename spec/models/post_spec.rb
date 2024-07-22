require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validate title?' do
    comment = Post.new(title: '', body: 'qefqwf')
    comment.valid?
    it { expect(comment.errors[:title]).not_to be_empty }
  end

  context 'validate body?' do
    comment = Post.new(title: 'qw', body: '')
    comment.valid?
    it { expect(comment.errors[:body]).not_to be_empty }
  end
end