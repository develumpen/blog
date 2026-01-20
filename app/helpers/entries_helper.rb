module EntriesHelper
  def pagination(page_count:)
    return if page_count <= 1

    page_links = (1..page_count).map { |page|
      if active_page?(page)
        tag.span page
      else
        link_to page, url_for(request.query_parameters.merge(page:))
      end
    }

    safe_join(page_links, " ")
  end

  private
    # because current_page? is already taken
    def active_page?(page)
      (page == 1 && !params[:page]) ||
      page == params[:page].to_i
    end
end
