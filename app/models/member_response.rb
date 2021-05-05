class MemberResponse < ApplicationRecord
    validates :response, presence: false
    belongs_to :member
end
