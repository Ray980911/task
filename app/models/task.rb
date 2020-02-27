class Task < ApplicationRecord
  belongs_to :user
  enum status: { 未対応: 0, 対応中: 1 } 
end
