class Comment < ApplicationRecord
  belongs_to :post                         #это значит что данные пренадлежат к определённому посту
end
