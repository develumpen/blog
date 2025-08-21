class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show ]

  def index
    @entries = Entry.published.order(published_at: :desc)
  end

  def show
    @new_comment = @entry.comments.new
    @comments = @entry.comments.persisted
  end

  private
    def set_entry
      @entry = Entry.find_by_slug(params[:slug])
    end
end
