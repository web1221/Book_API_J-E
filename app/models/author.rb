class Author < ApplicationRecord
    has_many :books, dependent: :destroy

    validates :name, presence: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }

    scope :random, -> { offset(rand(Author.count)).first }
end
