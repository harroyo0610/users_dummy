class User < ActiveRecord::Base
    # ej. User.authenticate('fernando@codea.mx', 'qwerty')
    validates :email, presence: true, uniqueness:true

  def self.authenticate(email, password)
    valid_user_email = User.find_by(email: email)
    valid_user_password = User.find_by(password: password)
  end

end