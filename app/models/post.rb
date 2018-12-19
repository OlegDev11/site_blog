class Post < ApplicationRecord
  has_many :comments, dependent: :destroy                   #пост имеет много коментариев, зависит от удаления
  validates :title, presence: true, length: {minimum: 5}    #проверка на валидацию заголовка, ввод миним. 5 символов
end
