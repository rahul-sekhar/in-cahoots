require 'rails_helper'

describe Admin::ProjectsController, type: :controller do
  before do
    sign_in create(:admin)
  end


  # Index

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




  # Show

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




  # New

  describe 'GET new' do
    let(:make_request){ get :new }

    it 'has a 200 status' do
      make_request
      expect(response.status).to eq 200
    end

    it 'assigns a blank project' do
      make_request
      expect(assigns(:project)).to be_a Project
      expect(assigns(:project)).to be_new_record
    end
  end



  # Create

  describe 'POST create' do
    let(:make_request){ post :create, project: project_data}

    describe 'with invalid data' do
      let(:project_data){ {
        description: 'For testing'
      } }

      it 'has a 422 status' do
        make_request
        expect(response.status).to eq 422
      end

      it 'does not create a project' do
        expect{ make_request }.not_to change{ Project.count }
      end

      it 'assigns the project data' do
        make_request
        expect(assigns(:project).description).to eq 'For testing'
      end
    end

    describe 'with valid data' do
      let(:project_data){ {
        title: 'New project',
        description: 'For testing'
      } }

      it 'has a 302 status' do
        make_request
        expect(response.status).to eq 302
      end

      it 'creates a project' do
        expect{ make_request }.to change{ Project.count }.by(1)
      end

      it 'sets project data' do
        make_request
        project = Project.last
        expect(project.title).to eq 'New project'
        expect(project.description).to eq 'For testing'
      end

      it 'redirects to the projects page' do
        make_request
        expect(response).to redirect_to admin_projects_path
      end
    end
  end



  # Update

  describe 'PATCH update' do
    let(:project){ create(:project, title: 'Old project') }
    let(:make_request){ patch :update, id: project.id, project: project_data}

    describe 'with invalid data' do
      let(:project_data){ {
        title: '',
        description: 'For testing'
      } }

      it 'has a 422 status' do
        make_request
        expect(response.status).to eq 422
      end

      it 'does not change the project' do
        make_request
        project.reload
        expect(project.title).to eq 'Old project'
      end

      it 'sets the assigned project and the update data' do
        make_request
        expect(assigns(:project)).to eq project
        expect(assigns(:project).title).to eq ''
      end
    end

    describe 'with valid data' do
      let(:project_data){ {
        title: 'Changed project',
        description: 'For testing'
      } }

      it 'has a 302 status' do
        make_request
        expect(response.status).to eq 302
      end

      it 'updates the project' do
        make_request
        project.reload
        expect(project.title).to eq 'Changed project'
        expect(project.description).to eq 'For testing'
      end

      it 'redirects to the projects page' do
        make_request
        expect(response).to redirect_to admin_projects_path
      end
    end
  end

  # Destroy

  describe 'DELETE destroy' do
    let(:make_request){ delete :destroy, id: project.id }
    let(:project){ FactoryGirl.create(:project) }

    it 'has a 302 status' do
      make_request
      expect(response.status).to eq 302
    end

    it 'deletes the project' do
      make_request
      expect_to_be_destroyed project
    end

    it 'redirects to the projects page' do
      make_request
      expect(response).to redirect_to admin_projects_path
    end
  end
end