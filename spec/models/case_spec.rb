require 'spec_helper'
require 'fixtures/case_helper'

describe Case do
  CASE_GET_URL = "https://jagadeeshgajula.desk.com/api/v2/filters/2026388/cases"
  CASE_POST_URL = "https://jagadeeshgajula.desk.com/api/v2/cases/1"
  CASE_MALFORMED_URL = "https://jagadeeshgajula.desk.com/api/v2/filters/0/cases"

  before do
    stub_request(:get, CASE_GET_URL).to_return(body: CASES_JSON_STRING)
    stub_request(:get, CASE_MALFORMED_URL).to_return(status: 404, body: CASE_JSON_MALFORMED)
  end

  subject { Case }
  context ".fetch" do
    before do
      @cases = subject.fetch(2026388)
    end

    it "returns all cases for filer 2026388" do
      expect(@cases.class).to eq Array
      expect(@cases.length).to eq 2
    end

  end
end
