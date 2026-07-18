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

      def edit_redirect(entry)
        edit_admin_page_path(entry)
      end

      def update_redirect(entry)
        admin_page_path(entry)
      end

      def destroy_redirect
        admin_pages_path
      end
  end
end
