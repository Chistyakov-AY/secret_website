# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user_confirmed) { sign_in create(:user) }
  let!(:post_created) { create :post }
  let!(:comment_created) { create :comment }
 
  describe '#index' do #ok
    let(:get_response) { get :index, params: { post_id: post_created.id } }
    subject { get_response }

    it { is_expected.to render_template('index') }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#new' do #ok
    let(:get_response) { get :new, params: { post_id: post_created.id } }
    subject { get_response }

    it { is_expected.to render_template('new') }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#create' do #ok
    let(:new_comment) { create(:comment, body: 'Body', post_id: post_created.id) }
    let(:find_comment) { Comment.find_by(params)}
    let(:params) { {id: new_comment.id } }

    context 'when saved comment in db' do 
      it { expect(find_comment).not_to be_nil }
      it { expect(response).to have_http_status(200) }
    end
  end
end