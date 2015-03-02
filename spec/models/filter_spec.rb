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

    it "returns an Array of Case objects" do
      @filters.each do |f|
        expect(f.class).to eq Filter
      end
    end
  end

  context ".new" do
    before do
      @filter = subject.new(FILTER_HASH)
    end

    it "takes a hash and returns its id via its getter method" do
      expect(@filter.id).to eq "2026388"
    end

    it "takes a hash and attributes can be accessed via method missing" do
      expect(@filter.name).to eq "Inbox"
      expect(@filter.active).to eq true
    end
  end
end