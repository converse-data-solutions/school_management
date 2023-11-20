class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  before_create :set_initial_status

  private

  def set_initial_status
    self.deleted = :Active
  end
end
