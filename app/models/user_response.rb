class UserResponse < ApplicationRecord
    validates :response, presence: true
end
