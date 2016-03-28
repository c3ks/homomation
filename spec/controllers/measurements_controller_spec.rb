require 'rails_helper'

RSpec.describe MeasurementsController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      device = FactoryGirl.create(:device)
      get :index, id: device.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      device = FactoryGirl.create(:device)
      get :index, id: device.id
      expect(response).to render_template('index')
    end

    it 'loads all data into @data' do
      device = FactoryGirl.create(:device)
      measurement1 = FactoryGirl.create(:measurement, device: device)
      measurement2 = FactoryGirl.create(:measurement, device: device)
      get :index, id: device.id
      expect(assigns(:measurements)).to match_array([measurement1, measurement2])
    end
  end

  describe 'POST #create' do
    it 'responds successfully with an HTTP 500 status code when secret missing' do
      device = FactoryGirl.create(:device)
      post :create, id: device.id, measurement: { data: 'test input' }
      # expect(response).to_not be_success
      expect(response).to have_http_status(500)
      expect(Measurement.all.count).to eq(0)
    end

    it 'responds successfully with an HTTP 500 status code when secret unknown' do
      device = FactoryGirl.create(:device, secret: 'totally secret')
      post :create, id: device.id, secret: 'abc', measurement: { data: 'test input' }
      # expect(response).to_not be_success
      expect(response).to have_http_status(500)
      expect(Measurement.all.count).to eq(0)
    end

    it 'responds successfully with an HTTP 200 status code when secret matching' do
      device = FactoryGirl.create(:device, secret: '6146023')
      post :create, id: device.id, secret: '6146023', measurement: { data: 'test input' }
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(Measurement.last.data).to eq('test input')
    end
  end
end
