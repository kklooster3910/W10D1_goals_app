class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    before_validation :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        user && user.is_password?(password) ? user : nil
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    
    private  

    def ensure_session_token
       self.session_token ||= SecureRandom::urlsafe_base64
    end
    
end

#first test password =  method, need this method to create a user
#