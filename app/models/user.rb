include BCrypt

class User < ActiveRecord::Base
    
    # ej. User.authenticate('fernando@codea.mx', 'qwerty')
    validates :email, presence: true, uniqueness:true

    
  # def self.authenticate(email, password)
  #   valid_user_email = User.find_by(email: email)
  #   valid_user_password = User.find_by(password: password)
  # end
  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

end