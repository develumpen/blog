class MenuItem < ApplicationRecord
  belongs_to :entry, optional: true
end
