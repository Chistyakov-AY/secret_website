# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#comment model' do
    comment = described_class.new(body: '')
    comment.valid?
    it { expect(comment.errors[:body]).not_to be_empty }
  end
end
