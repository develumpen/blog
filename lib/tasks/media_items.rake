namespace :media_items do
  desc "Migrate record_type for media_items"
  task migrate: [ :environment ] do
    ActiveStorage::Attachment
      .where(record_type: "MediaItem")
      .update_all(record_type: "Blog::MediaItem")
  end
end
