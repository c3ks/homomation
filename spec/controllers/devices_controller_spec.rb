require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
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
      device1 = FactoryGirl.create(:device)
      device2 = FactoryGirl.create(:device)
      get :index

      expect(assigns(:devices)).to match_array([device1, device2])
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
    it 'responds successfully with an HTTP 200 status code and renders the edit template' do
      location = FactoryGirl.create(:location)
      post :create, device: { name: 'Device 1', location_id: location.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template('edit')
      expect(Device.last.name).to eq('Device 1')
    end
  end

  describe 'GET #edit' do
    it 'responds successfully with an HTTP 200 status code' do
      device = FactoryGirl.create(:device)
      get :edit, id: device.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the edit template' do
      device = FactoryGirl.create(:device)
      get :edit, id: device.id
      expect(response).to render_template('edit')
    end
  end

  describe 'PUT #update' do
    it 'responds successfully with an HTTP 200 status code' do
      device = FactoryGirl.create(:device, name: 'Device 1')
      expect(device.name).to eq('Device 1')
      post :update, id: device.id, _method: :patch, device: { name: 'Device 2' }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(Device.find(device.id).name).to eq('Device 2')
    end
  end

  describe 'DELETE #destroy' do
    it 'responds successfully with an HTTP 302 status code' do
      device = FactoryGirl.create(:device)
      get :destroy, id: device.id, _method: :delete
      # expect(response).to be_success
      expect(response).to have_http_status(302)
      puts Device.where(id: device.id).inspect
      expect(Device.where(id: device.id).count).to be(0)
    end
  end
end
