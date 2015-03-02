require 'spec_helper'
require 'fixtures/filter_helper'

describe Filter do
  FILTER_URL = "https://jagadeeshgajula.desk.com/api/v2/filters"

  before(:each) do
    stub_request(:get, FILTER_URL).to_return(body: FILTERS_JSON_STRING)
  end

  subject { Filter }
  context ".fetch" do
    before do
      @filters = subject.fetch()
    end

    it "returns all 10 filters" do
      expect(@filters.class).to eq Array
      expect(@filters.length).to eq 10
    end

  end
end