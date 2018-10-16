class User < ActiveRecord::Base
  has_secure_password
  


  def self.authenticate_with_credentials(email, password)
    
    nemail = email.to_s.rstrip.lstrip.downcase
    
    user = User.find_by_email(nemail)
    user && user.authenticate(password) ? user : nil
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum:6 } 

end
