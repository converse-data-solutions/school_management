class Standard < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :students, through: :sections
  accepts_nested_attributes_for :sections, allow_destroy: true

  before_create :create_default_section

  private

  def create_default_section
    sections.build(section_name: 'A') if sections.empty?
  end
end
