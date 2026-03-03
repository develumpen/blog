module Blog
  class Engine < ::Rails::Engine
    isolate_namespace Blog

    initializer "blog.assets" do |app|
      app.config.assets.paths << root.join("app/javascript")
    end

    initializer "blog.importmap", before: "importmap" do |app|
      app.config.importmap.paths << root.join("config/importmap.rb")
      app.config.importmap.cache_sweepers << root.join("app/javascript")
    end
  end
end
