class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order({ :created_at => :desc })
    render({ :template => "photo_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_photo = Photo.find(the_id)

    render({ :template => "photo_templates/show" })
  end

  def update
    the_id = params.fetch("path_id")
    @the_photo = Photo.find(the_id)

    @the_photo.image = params.fetch("query_image")
    @the_photo.caption = params.fetch("query_caption")

    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{@the_photo.id}", { :alert => "Photo failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_photo = Photo.find(the_id)

    @the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
end
