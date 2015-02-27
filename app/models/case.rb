class Case
  include SalesforceApi

  def self.fetch(id)
    callapi(:get, "filters/#{id.to_i.to_s}/cases")
  end

  def self.update(id, attributes)
    callapi(:patch, "cases/#{id.to_i.to_s}", attributes)
  end
end
