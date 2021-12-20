class Assignment < ActiveRecord::Base
    has_many :user_assignments
    has_many :users, through: :user_assignments#, source: :user_id
    has_one_attached :file, allow_nil: true
   
    
    
end 

