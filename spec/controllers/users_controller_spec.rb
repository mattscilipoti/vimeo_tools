require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) do
        { user: { email: 'test@example.com', password: 'password123', password_confirmation: 'password123' } }
      end

      it 'creates a new user' do
        expect { post :create, params: valid_params }.to change(User, :count).by(1)
      end

      it 'redirects to overview' do
        post :create, params: valid_params
        expect(response).to redirect_to('/overview')
      end

      it 'sets the session' do
        post :create, params: valid_params
        expect(session[:user_id]).to eq(User.last.id)
      end
    end

    context 'with invalid params' do
      it 'does not create a user with missing email' do
        expect {
          post :create, params: { user: { email: '', password: 'password123', password_confirmation: 'password123' } }
        }.not_to change(User, :count)
      end

      it 'renders the new template' do
        post :create, params: { user: { email: '', password: 'password123', password_confirmation: 'password123' } }
        expect(response).to render_template(:new)
      end
    end
  end
end
