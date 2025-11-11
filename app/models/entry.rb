class Entry < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  before_validation :set_slug
  before_validation :set_body_html

  validates :title, presence: true

  scope :published, -> { where(draft: false).where("published_at < ?", Time.current) }

  scope :filter_by_tags, ->(tags) {
    tag_names = Array.wrap(tags)

    return all unless tag_names.any?

    joins(:tags)
      .where(tags: { name: tag_names })
      .group(:id)
      .having(
        Tag.arel_table[:id].count(true).eq(tag_names.size)
      )
  }

  def status
    return "draft" if draft
    return "scheduled" if published_at > Time.current
    "published"
  end

  private

    def set_body_html
      extensions = %i[ fenced_code_blocks]

      html = Markdown.new(body_markdown, *extensions).to_html

      self.body_html = set_img_srcset(html)
    end

    def set_slug
      return if self.slug.present?

      self.slug = title.parameterize
    end

    def set_img_srcset(html)
      doc = Nokogiri::HTML.fragment(html)
      doc.css("img").each { |img| replace_image(img, doc) }
      doc.to_html
    end

    def replace_image(img, doc)
      blob = image_blob(img["src"])

      variant = blob.representation(resize_to_limit: [ 800, 800 ])
      new_image_url = Rails.application.routes.url_helpers.rails_blob_url(variant, only_path: true)
      new_image = ActionController::Base.helpers.image_tag(new_image_url, alt: img["alt"])

      img.replace(new_image)
    end

    def image_blob(url)
      uri = URI.parse(url)

      return unless uri.path.start_with?("/rails/active_storage/representations/redirect")

      segments = uri.path.split("/")
      signed_id = segments[5..-1][0]

      return unless signed_id

      ActiveStorage::Blob.find_signed(signed_id)
    end
end
