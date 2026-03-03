require "blog/version"
require "blog/engine"

module Blog
  mattr_accessor :current_user, :mount_path, :per_page

  self.mount_path = "/blog"
  self.per_page = 10
end
