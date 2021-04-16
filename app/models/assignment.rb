class Assignment < ActiveRecord::Base
    has_many :user_assignments
    has_many :users, through: :user_assignments
    
    def assign_to_student
        users = User.all 
        keys_to_extract = [:id]
        users.map do |w|
        w.select { |k,_| keys_to_extract.include? k }
        end
    end
end 