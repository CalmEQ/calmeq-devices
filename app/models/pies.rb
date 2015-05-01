class Pies < ActiveRecord::Base
  skip_before_filter :verify_authenticity_token  
end
