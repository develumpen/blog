class EntriesController < ApplicationController
  before_action :set_entry_from_id, only: %i[ edit update destroy ]
  before_action :set_entry_from_slug, only: %i[ show ]

  def index
    @entries = Entry.order(published_at: :desc)
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to entry_slug_path(@entry.slug), notice: "Entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to entry_slug_path(@entry.slug), notice: "Entry was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy!
    redirect_to entries_path, notice: "Entry was successfully destroyed.", status: :see_other
  end

  private
    def set_entry_from_id
      @entry = Entry.find(params.expect(:id))
    end

    def set_entry_from_slug
      @entry = Entry.find_by_slug(params[:slug])
    end

    def entry_params
      params.expect(entry: [ :title, :slug, :published_at, :draft, :body_markdown ])
    end
end
