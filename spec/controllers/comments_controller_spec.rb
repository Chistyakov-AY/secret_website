# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user_confirmed) { sign_in create(:user) }
  let!(:post) { create :post }
  let!(:comment) { create :comment, post: }
  let!(:comment_other_post) { create :comment }

  describe '#index' do
    it do
      expect(get(:index, params: { post_id: post.id })).to render_template('index')
      expect(get(:index, params: { post_id: post.id })).to have_http_status(:ok)
    end
  end

  describe '#new' do
    it do
      expect(get(:new, params: { post_id: post.id })).to render_template('new')
      expect(get(:new, params: { post_id: post.id })).to have_http_status(:ok)
    end
  end

  describe '#create' do
    subject { post :index, params: { comment: params } }

    let(:post) { create(:post) }
    let(:params) { attributes_for :comment, post_id: post.id }
    let(:comment_expected) { Comment.find_by(params) }

    context 'when params valid' do
      it { expect(comment_expected).not_to be_nil }
      it { expect(response).to have_http_status(200) }
    end

    context 'when params invalid' do
      it { expect(comment_other_post).to be_nil }
      # it { expect(response).to have_http_status(200) }
    end
  end
end
