class Assignment < ActiveRecord::Base
    has_many :user_assignments
    has_many :users, through: :user_assignments
    
    
    end 