class Setting < ApplicationRecord
  validates :name, uniqueness: true
  validates :content, numericality: true, if: :number_setting?

  has_one_attached :image

  before_save :downcase_name
  before_save :strip_name_blankspace

  class << self
    def for name
      Setting.find_by(name: name.downcase)
    end
  end

  private

  def number_setting?
    self.form_control == 'number_field'
  end

  def downcase_name
    self.name = self.name.downcase
  end

  def strip_name_blankspace
    self.name = self.name.strip
  end
end
