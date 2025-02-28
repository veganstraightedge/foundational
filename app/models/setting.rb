class Setting < ApplicationRecord
  validates :name, uniqueness: true
  validates :content, numericality: true, if: :number_setting?

  has_one_attached :image

  before_save :strip_name_blankspace
  before_save :generate_slug

  class << self
    def for name
      Setting.find_by(slug: name.downcase)
    end

    def requiring_update
      where(update_required: true).select(&:requires_update?)
    end
  end

  def requires_update?
    update_required == true && content == default_content
  end

  private

  def strip_name_blankspace
    self.name = name.strip
  end

  def generate_slug
    # TODO: use .to_slug here?
    self.slug = name.downcase
  end

  def number_setting?
    form_control == 'number_field'
  end
end
