class Post < ApplicationRecord
  validates :body, presence: {message: " nie może być puste"}
  validates :title, presence: {message: " nie może być puste"}, length: {
                                      minimum:3, 
                                      maximum:200,
                                      too_short: " musi zawierać conajmniej 3 znaki",
                                      too_long: " jest za długi: Maksymalnie 200 znaków."}
                                      
  validates :category, :length => { :minimum => 1, too_short: "post musi zawierać przynajmniej jedną kategorię" }

  has_many :comments
  has_and_belongs_to_many :category
  belongs_to :user
end