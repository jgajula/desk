class User

  def self.current_user
    Desk.show_user(:current).raw
  end
end