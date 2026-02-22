require 'rails_helper'

RSpec.describe OverviewController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    context 'when not logged in' do
      it 'redirects to login' do
        get :index
        expect(response).to redirect_to('/login')
      end
    end

    context 'when logged in' do
      before { session[:user_id] = user.id }

      it 'returns success' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end
