class MemberResponse < ApplicationRecord
    validates :response, presence: true
    belongs_to :member
end
