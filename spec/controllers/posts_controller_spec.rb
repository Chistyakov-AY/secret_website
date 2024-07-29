# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user_confirmed) { sign_in create(:user) }
  let!(:post_created) { create :post }
  let!(:comment_created) { create :comment }

  describe '#index' do
    let(:get_response) { get :index }

    it do
      expect(get_response).to render_template('index')
      expect(get_response).to have_http_status(:ok)
    end
  end

  describe '#new' do
    subject(:new_post) { get :new, params: { id: post_created.id } }

    it do
      expect(new_post).to render_template('new')
      expect(new_post).to have_http_status(:ok)
    end
  end

  describe '#create' do
    let(:new_post) { create(:post, title: 'Title', body: 'Body') }
    let(:find_post) { Post.find_by(params) }
    let(:params) { { id: new_post.id } }

    context 'when params valid' do
      it { expect(find_post).not_to be_nil }
      it { expect(response).to have_http_status(200) }
    end

    # context 'when params in valid' do
    #   it { expect(find_post).not_to be_nil }
    #   it { expect(response).to have_http_status(200) }
    # end
  end

  describe '#update' do
    context 'with params' do
      let(:update_post) { patch :update, params: { id: post_created.id, post: { title: 'Test', body: 'Test' } } }

      it { expect(response).to have_http_status(200) }
    end
  end

  describe '#destroy' do
    subject { delete_post }

    let(:delete_post) { delete :destroy, params: { id: post_created.id } }

    it { is_expected.to have_http_status(:redirect) }
  end
end
