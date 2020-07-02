class Category < ApplicationRecord
  resourcify # for rolify roles

  has_many :categorizations, dependent: :destroy

  before_validation :remove_extra_spaces, on: %i[create update]
  before_validation :generate_slug,       on: %i[create update]

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, uniqueness: true

  def to_param
    slug
  end

  private

  def remove_extra_spaces
    self.name = name.to_s.squish
  end

  def generate_slug
    self.slug = name.to_s.transliterate.parameterize
  end
end
