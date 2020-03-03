class Task < ApplicationRecord
  belongs_to :user
  enum status: { 未対応: 0, 対応中: 1, 完了: 2 } 
  paginates_per 10
  scope :index_all, -> {
    select(:id, :title, :content, :created_at, :deadline, :status, :user_id).order(created_at: :asc).includes(:user)
  }

end
