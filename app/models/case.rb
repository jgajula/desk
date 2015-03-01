class Case

  def self.fetch(id)
    Desk.filter_cases(id).raw._embedded[:entries]
  end

  def self.update(id, attributes)
    Desk.update_case(id, attributes)
  end
end
