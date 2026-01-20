class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show ]

  PER_PAGE = 5.freeze

  def index
    @entries = Entry
                .published
                .filter_by_tags(params[:tags])
                .order(published_at: :desc)

    @page_count, @entries = paginate(@entries)
  end

  def show
    @new_comment = @entry.comments.new
    @comments = @entry.comments.persisted
  end

  private
    def set_entry
      @entry = Entry.find_by_slug!(params[:slug])
    end

    def current_page
      @current_page ||= begin
                          page = params[:page].to_i
                          page.positive? ? page : 1
                        end
    end

    def paginate(scope)
      total_count = scope.unscope(:limit, :offset).count
      total_pages = (total_count.to_f / PER_PAGE).ceil

      page = [ current_page, total_pages ].min
      offset = PER_PAGE * (page - 1)

      paginated = scope.limit(PER_PAGE).offset(offset)

      [ total_pages, paginated ]
    end
end
