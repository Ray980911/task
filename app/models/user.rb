class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one_attached :icon
  has_many :tasks, dependent: :destroy

end
