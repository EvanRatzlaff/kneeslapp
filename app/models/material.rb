class Material < ActiveRecord::Base
    belongs_to :user

    validates :time, presence: :true
    validates :date, presence: :true
    validates :room_performed, presence: :true
    validates :content, presence: :true
end
