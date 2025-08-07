class Entry < ApplicationRecord
  before_validation :set_slug
  before_validation :set_body_html

  validates :title, presence: true

  scope :published, -> { where(draft: false).where("published_at < ?", Time.current) }

  def status
    return "draft" if draft
    return "scheduled" if published_at > Time.current
    "published"
  end

  private

  def set_body_html
    self.body_html = Markdown.new(body_markdown).to_html
  end

  def set_slug
    return if self.slug.present?

    self.slug = title.parameterize
  end
end
