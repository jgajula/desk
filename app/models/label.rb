class Label
  include SalesforceApi

  GROUP = 3
  PARAM = ["name", "description"]

  def self.fetch()
    callapi(:get, "labels")
  end

  def self.create(attributes)
    callapi(:post, "labels", attributes)
  end
end
