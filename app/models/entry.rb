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

    self.body_html = Markdown.new(body_markdown, *extensions).to_html
  end

  def set_slug
    return if self.slug.present?

    self.slug = title.parameterize
  end
end
