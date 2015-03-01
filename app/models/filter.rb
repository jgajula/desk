class Filter

  def self.fetch()
    Desk.filters.raw._embedded[:entries]
  end
end
