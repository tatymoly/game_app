class Game < ApplicationRecord
    validates :user_number, :cpu_number, presence: true
    validates :user_number, inclusion: { in: 1..100,
    message: "Please type a number between 1 and 100" }
end
