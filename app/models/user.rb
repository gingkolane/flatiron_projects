class User < ApplicationRecord
  has_many :lists
  
  has_secure_password

  validates :username, uniqueness: true

  # def password=(passArg)
  #   self.password_digest = BCrypt::Password.create(passArg)
  # end
  
  # def authenticate(plain_text_password)
  #   BCrypt::Password.new(self.password_digest) == plain_text_password
  # end

end
