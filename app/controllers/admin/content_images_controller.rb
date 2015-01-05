class Admin::ContentImagesController < Admin::ApplicationController
  def index
    @content_images = ContentImage.all

    @new_content_image = ContentImage.new
  end

  def create
    @content_image = ContentImage.new(content_image_params)

    @content_image.save

    redirect_to admin_content_images_path
  end

  def destroy
    @content_image = ContentImage.find(params[:id])
    @content_image.destroy!
    redirect_to admin_content_images_path
  end

  private

  def content_image_params
    params.require(:content_image).permit(:image)
  end
end