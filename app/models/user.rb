class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image, dependent: :destroy
  before_create :set_initial_status
  has_many :students, dependent: :destroy
  has_many :attendances, as: :attendable
  has_many :notices, dependent: :destroy

  validates :username, uniqueness: { message: 'Username is not available.' }

  scope :activeparent, -> { where(role: 'parent', removed: false) }
  scope :activestaff, -> { where(role: 'staff', removed: false) }
  scope :validstaff, -> { where(role: 'staff', status: 'Active', removed: false) }
  private

  def set_initial_status
    self.status = :Active
  end
end
