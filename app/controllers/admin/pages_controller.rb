module Admin
  class PagesController < EntriesController
    private
      def resource_key
        :page
      end

      def scope
        Entry.where(unlisted: true)
      end

      def default_attributes
        { unlisted: true }
      end

      def edit_redirect_path(entry)
        edit_admin_page_path(@entry)
      end
  end
end
