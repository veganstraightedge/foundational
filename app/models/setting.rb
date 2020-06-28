class Setting < ApplicationRecord
  validates :name, uniqueness: true

  # has_one_attached :image

  before_save :downcase_name
  before_save :strip_name_blankspace

  class << self
    def for name
      Setting.find_by(name: name.downcase)
    end
  end

  private

  def downcase_name
    self.name = self.name.downcase
  end

  def strip_name_blankspace
    self.name = self.name.strip
  end
end
