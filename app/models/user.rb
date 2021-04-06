class User < ActiveRecord::Base
    has_secure_password

    enum role: {student: 1, teacher: 2, admin: 3}
    has_many :user_assignments
    has_many :assignments, through: :user_assignments

    validates_presence_of :username

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
    validates :password, confirmation: { case_sensitive: true }


    def student
      self.role == "student"
    end 

    def teacher
      self.role == "teacher"
    end 

    def admin
      @current_user.role == "admin"
    end 
  end