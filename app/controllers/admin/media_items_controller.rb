class Admin::MediaItemsController < ApplicationController
  before_action :set_media_item, only: %i[ destroy ]

  def index
    @media_items = MediaItem.all
    @media_item = MediaItem.new
  end

  def create
    @media_item = MediaItem.new(media_item_params)

    if @media_item.save
      redirect_to admin_media_items_path, notice: "Media item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @media_item.destroy
      flash[:notice] = "Media item was successfully destroyed."
    else
      flash[:alert] = "An error occurred: media item couldn't be destroyed."
    end

    redirect_to admin_media_items_path
  end

  private
    def media_item_params
      params.expect(media_item: [ :media ])
    end

    def set_media_item
      @media_item = MediaItem.find(params[:id])
    end

    def hide_delete?
      params[:hide_delete].present?
    end
    helper_method :hide_delete?

    def media_item_target
      params[:target]
    end
    helper_method :media_item_target
end
