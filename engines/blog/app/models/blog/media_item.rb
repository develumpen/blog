module Blog
  class MediaItem < ApplicationRecord
    has_one_attached :media
  end
end
