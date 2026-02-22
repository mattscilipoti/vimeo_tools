require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user, password: 'password123') }

  describe 'GET #new' do
    it 'returns success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'sets the session user_id' do
        post :create, params: { email: user.email, password: 'password123' }
        expect(session[:user_id]).to eq(user.id)
      end

      it 'redirects to overview' do
        post :create, params: { email: user.email, password: 'password123' }
        expect(response).to redirect_to('/overview')
      end
    end

    context 'with invalid credentials' do
      it 'does not set session' do
        post :create, params: { email: user.email, password: 'wrongpassword' }
        expect(session[:user_id]).to be_nil
      end

      it 'renders the new template' do
        post :create, params: { email: user.email, password: 'wrongpassword' }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    before { session[:user_id] = user.id }

    it 'clears the session' do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to login' do
      delete :destroy
      expect(response).to redirect_to('/login')
    end
  end
end
