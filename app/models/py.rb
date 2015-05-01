class Py < ActiveRecord::Base


  validates :identifier, presence: true,
                    length: { minimum: 5 }
end
