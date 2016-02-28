require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
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
      location1 = FactoryGirl.create(:location)
      location2 = FactoryGirl.create(:location)
      get :index

      expect(assigns(:locations)).to match_array([location1, location2])
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
      post :create, location: { name: 'Room 1' }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(Location.last.name).to eq('Room 1')
    end
  end

  describe 'GET #edit' do
    it 'responds successfully with an HTTP 200 status code' do
      location = FactoryGirl.create(:location)
      get :edit, id: location.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT #update' do
    it 'responds successfully with an HTTP 200 status code' do
      location = FactoryGirl.create(:location, name: 'Room 1')
      expect(location.name).to eq('Room 1')
      post :update, id: location.id, _method: :patch, location: { name: 'Room 2' }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(Location.find(location.id).name).to eq('Room 2')
    end
  end

  describe 'DELETE #destroy' do
    it 'responds successfully with an HTTP 200 status code' do
      location = FactoryGirl.create(:location, name: 'Room 1')
      get :destroy, id: location.id, _method: :delete
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(Location.find(location.id)).to be(nil)
    end
  end
end
