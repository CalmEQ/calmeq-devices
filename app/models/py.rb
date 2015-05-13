class Py < ActiveRecord::Base
    has_many :readings
#  validates :identifier, presence: true,
 #                   length: { minimum: 5 }
end
