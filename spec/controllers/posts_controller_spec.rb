# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user_confirmed) { sign_in create(:user) }
  let!(:post_created) { create :post }
  let!(:comment_created) { create :comment }
 
  describe '#index' do #ok
    let(:get_response) { get :index }
    subject { get_response }

    it { is_expected.to render_template('index') }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#new' do #ok
    let(:get_response) { get :new, params: { id: post_created.id } }
    subject { get_response }

    it { is_expected.to render_template('new') }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#create' do #ok
    let(:new_post) { create(:post, title: 'Title', body: 'Body') }
    let(:find_post) { Post.find_by(params)}
    let(:params) { { id: new_post.id } }

    context 'when saved post in db' do 
      it { expect(find_post).not_to be_nil }
      it { expect(response).to have_http_status(200) }
    end
  end

  describe '#update' do #ok
    context 'with params' do 
      let(:update_post) { patch :update, params: { id: post_created.id, post: { title: 'Test', body: 'Test' } } }

      it { expect(response).to have_http_status(200) }
    end
  end

  describe '#destroy' do #ok
    let(:delete_post) { delete :destroy, params: { id: post_created.id } }
    subject { delete_post }

    it { is_expected.to have_http_status(:redirect) }
  end
end