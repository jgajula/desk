class Label

  GROUP = 3
  PARAM = ["name", "description"]

  def self.fetch()
    Desk.labels.raw._embedded
  end

  def self.create(attributes)
    Desk.create_label(attributes)
  end
end
