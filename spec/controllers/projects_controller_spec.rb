require 'rails_helper'

describe ProjectsController, type: :controller do
  describe 'GET index' do
    let(:make_request){ get :index }
    let!(:project1){ FactoryGirl.create(:project) }
    let!(:project2){ FactoryGirl.create(:project) }

    it 'has a 200 status' do
      make_request
      expect(response.status).to eq 200
    end

    it 'assigns projects' do
      make_request
      expect(assigns(:projects)).to match_array [project1, project2]
    end
  end

  describe 'GET show' do
    let(:make_request){ get :show, id: project1.id }
    let!(:project1){ FactoryGirl.create(:project) }

    it 'has a 200 status' do
      make_request
      expect(response.status).to eq 200
    end

    it 'assigns project' do
      make_request
      expect(assigns(:project)).to eq project1
    end
  end
end