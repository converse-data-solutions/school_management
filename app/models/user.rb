class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validates :username, presence: true, uniqueness: true
  validates :address, presence: true
  validates :mobile_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                            length: { is: 6 }
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'Must Start With Alphabet Character') unless value =~ /\A[a-zA-Z]/
  end
end
