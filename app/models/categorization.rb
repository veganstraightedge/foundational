class Categorization < ApplicationRecord
  resourcify # for rolify roles

  belongs_to :category
end
