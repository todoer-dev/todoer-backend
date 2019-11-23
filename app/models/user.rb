class User < ApplicationRecord
  has_secure_password

  def anonymous?
    false
  end
end
