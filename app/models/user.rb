class User < ApplicationRecord
  has_secure_password

  has_many :tasks

  validates_uniqueness_of :email

  def anonymous?
    false
  end
end
