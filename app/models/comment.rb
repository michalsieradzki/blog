class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: {message: " nie może być pusty"}, length: { 
    maximum:150,
    too_long: " jest za długi: Maksymalnie 200 znaków."}
end
