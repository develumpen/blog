class Entry < ApplicationRecord
  before_validation :set_slug
  before_validation :set_body_html

  validates :title, presence: true

  private

  def set_body_html
    self.body_html = body_markdown
  end

  def set_slug
    return if self.slug.present?

    self.slug = title.parameterize
  end
end
