module Authenticatable
  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    hashed_password = password.chars.map {|c| c.ord }.inject {|sum, n| sum + n}
    self.password_digest = hashed_password
  end

  def authenticate(password)
    hashed_password = password.chars.map {|c| c.ord }.inject {|sum, n| sum + n}
    if self.password_digest == hashed_password.to_s
      self
    else
      false
    end
  end

  private

  def confirm_password
    if password_confirmation.present?  && password_confirmation != password
      errors.add(:password, 'must match password confirmation')
    end
  end

end
