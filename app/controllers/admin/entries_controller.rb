module Admin
  class EntriesController < AdminController
    before_action :set_entry, only: %i[ edit update destroy ]

    def index
      @entries = scope.order(published_at: :desc)
    end

    def show
    end

    def new
      @entry = scope.new(default_attributes)
    end

    def edit
    end

    def create
      @entry = scope.new(entry_params.merge(default_attributes))

      if @entry.save
        redirect_to edit_redirect(@entry), notice: "Entry was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @entry.update(entry_params)
        redirect_to update_redirect(@entry), notice: "Entry was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @entry.destroy!
      redirect_to destroy_redirect, notice: "Entry was successfully destroyed.", status: :see_other
    end

    private
      def resource_key
        :entry
      end

      def scope
        Entry.where(unlisted: false)
      end

      def default_attributes
        { unlisted: false }
      end

      def set_entry
        @entry = scope.find(params.expect(:id))
      end

      def entry_params
        params.expect(entry: [ :title, :slug, :published_at, :draft, :body_markdown, tag_ids: [] ])
      end

      def edit_redirect(entry)
        edit_admin_entry_path(entry)
      end

      def update_redirect(entry)
        admin_entry_path(entry)
      end

      def destroy_redirect
        admin_entries_path
      end
  end
end
