# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'with validate title' do
    comment = described_class.new(title: '', body: 'qefqwf')
    comment.valid?
    it { expect(comment.errors[:title]).not_to be_empty }
  end

  context 'with validate body' do
    comment = described_class.new(title: 'qw', body: '')
    comment.valid?
    it { expect(comment.errors[:body]).not_to be_empty }
  end
end
