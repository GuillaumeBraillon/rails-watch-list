class Review < ApplicationRecord
  belongs_to :list
   validates :content, :name, presence: true
   validates :content, length: { minimum: 6 }
end
