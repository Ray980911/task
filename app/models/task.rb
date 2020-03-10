class Task < ApplicationRecord
  belongs_to :user
  enum status: { 未対応: 0, 対応中: 1, 完了: 2 } 
  paginates_per 10
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :status, presence: true

  scope :index_all, -> {
    select(:id, :title, :content, :created_at, :deadline, :status, :user_id).order(deadline: :asc).includes(:user)
  }

end
