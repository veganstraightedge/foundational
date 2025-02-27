class Tagging < ApplicationRecord
  resourcify # for rolify roles

  belongs_to :tag
end
