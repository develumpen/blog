class FeedsController < ApplicationController
  def show
    @entries = Entry.published.order(published_at: :desc).limit(20)

    respond_to do |format|
      format.atom
    end
  end
end
