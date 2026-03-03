# Blog engine point to tables before extraction

Rails.application.config.to_prepare do
  Blog::Entry.table_name = "entries"
  Blog::Comment.table_name = "comments"
  Blog::Tag.table_name = "tags"
  Blog::Tagging.table_name = "taggings"
  Blog::MediaItem.table_name = "media_items"
end

# Blog engine configuration

Blog.mount_path = "/"
Blog.per_page = 5
