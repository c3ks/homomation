require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all devices into @devices' do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      get :index

      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'responds successfully with an HTTP 200 status code' do
      post :create, user: { name: 'Room 1' }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(User.last.name).to eq('Room 1')
    end
  end

  describe 'GET #edit' do
    it 'responds successfully with an HTTP 200 status code' do
      user = FactoryGirl.create(:user)
      get :edit, id: user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the edit template' do
      user = FactoryGirl.create(:user)
      get :edit, id: user.id
      expect(response).to render_template('edit')
    end
  end

  describe 'PUT #update' do
    it 'responds successfully with an HTTP 200 status code' do
      user = FactoryGirl.create(:user, name: 'Room 1')
      expect(user.name).to eq('Room 1')
      post :update, id: user.id, _method: :patch, user: { name: 'Room 2' }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(User.find(user.id).name).to eq('Room 2')
    end
  end

  describe 'DELETE #destroy' do
    it 'responds successfully with an HTTP 302 status code' do
      user = FactoryGirl.create(:user, name: 'Room 1')
      get :destroy, id: user.id, _method: :delete
      # expect(response).to be_success
      expect(response).to have_http_status(302)
      expect(User.where(id: user.id).count).to be(0)
    end
  end
end
