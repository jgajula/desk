class Filter
  include SalesforceApi

  def id
    @data["_links"]["self"]["href"][/\d+$/]
  end

  def self.fetch()
    callapi(:get, "filters")
  end
end
