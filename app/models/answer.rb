class Answer < ApplicationRecord
  validates :description, null: false, length: { minimum: 50 }

  belongs_to :question
end
