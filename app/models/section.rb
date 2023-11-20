class Section < ApplicationRecord
  belongs_to :standard

  validates :name, presence: true
end
