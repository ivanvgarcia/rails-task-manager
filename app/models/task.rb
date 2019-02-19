class Task < ApplicationRecord
  validates :title, presence: true, length: { in: 3..20 }
  validates :details, presence: true, length: { in: 5..150 }
end
