class User < ApplicationRecord
  has_secure_password

  has_many :tasks

  def anonymous?
    false
  end
end
