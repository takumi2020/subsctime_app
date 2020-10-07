require 'rails_helper'

RSpec.describe "UserAuthentications", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }

  describe 'POST #create' do
    before do
      ActionMailer::Base.deliveries.clear
    end
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      

      it 'createが成功すること' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it 'リダイレクトされること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to root_url
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      

      it 'createが失敗すること' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end

    end
  end

  # describe 'GET #edit' do
  #   subject { get edit_user_registration_path }
  #   context 'ログインしている場合' do
  #     before do
  #       sign_in user
  #     end
  #     it 'リクエストが成功すること' do
  #       is_expected.to eq 200
  #     end
  #   end
  # end

  # describe 'GET #show' do
  #   context 'ユーザーが存在しない場合' do
  #     it 'エラーが発生すること' do
  #       user_id = user.id
  #       user.destroy
  #       expect{ get "/users" }.to raise_error ActiveRecord::RecordNotFound
  #     end
  #   end
  # end
end