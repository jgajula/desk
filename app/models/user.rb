class User
  include SalesforceApi

  def self.current_user
    callapi(:get, "users/current")
  end
end