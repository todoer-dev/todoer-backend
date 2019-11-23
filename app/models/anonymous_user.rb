# frozen_string_literal: true

class AnonymousUser
  include Singleton

  def anonymous?
    true
  end
end
