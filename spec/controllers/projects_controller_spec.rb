require 'rails_helper'

describe ProjectsController, type: :controller do
  describe 'GET index' do
    let(:make_request){ get :index }

    before do
      @project1 = FactoryGirl.create(:project)
      @project2 = FactoryGirl.create(:project)
    end

    it 'has a 200 status' do
      make_request
      expect(response.status).to eq 200
    end

    it 'assigns projects' do
      make_request
      expect(assigns(:projects)).to match_array [@project1, @project2]
    end
  end
end