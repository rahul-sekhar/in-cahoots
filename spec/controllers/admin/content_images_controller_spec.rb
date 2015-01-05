require 'rails_helper'

describe Admin::ContentImagesController, type: :controller do
  before do
    sign_in create(:admin)
  end


  # Index

  describe 'GET index' do
    let(:make_request){ get :index }
    let!(:content_image1){ FactoryGirl.create(:content_image) }
    let!(:content_image2){ FactoryGirl.create(:content_image) }

    it 'has a 200 status' do
      make_request
      expect(response.status).to eq 200
    end

    it 'assigns projects' do
      make_request
      expect(assigns(:content_images)).to match_array [content_image1, content_image2]
    end
  end



  # Create

  describe 'POST create' do
    let(:make_request){ post :create, content_image: image_data }

    describe 'with invalid data' do
      let(:image_data){ {
        image: nil
      } }

      it 'has a 302 status' do
        make_request
        expect(response.status).to eq 302
      end

      it 'does not create a content image' do
        expect{ make_request }.not_to change{ ContentImage.count }
      end

      it 'redirects to the content images page' do
        make_request
        expect(response).to redirect_to admin_content_images_path
      end
    end

    describe 'with valid data' do
      let(:image_data){ {
        image: fixture_file_upload('files/image.jpg', 'image/jpeg')
      } }

      it 'has a 302 status' do
        make_request
        expect(response.status).to eq 302
      end

      it 'creates a content image' do
        expect{ make_request }.to change{ ContentImage.count }.by(1)
      end

      it 'sets image data' do
        make_request
        image = ContentImage.last
        expect(image.image_file_name).to eq 'image.jpg'
      end

      it 'redirects to the content images page' do
        make_request
        expect(response).to redirect_to admin_content_images_path
      end
    end
  end



  # Destroy

  describe 'DELETE destroy' do
    let(:make_request){ delete :destroy, id: content_image.id }
    let(:content_image){ FactoryGirl.create(:content_image) }

    it 'has a 302 status' do
      make_request
      expect(response.status).to eq 302
    end

    it 'deletes the content image' do
      make_request
      expect_to_be_destroyed content_image
    end

    it 'redirects to the content images page' do
      make_request
      expect(response).to redirect_to admin_content_images_path
    end
  end
end