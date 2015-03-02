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

    it "returns an Array of Case objects" do
      @cases.each do |c|
        expect(c.class).to eq Case
      end
    end

    it "raises an exception" do
      expect{subject.fetch(0)}.to raise_error(ApiError)
    end
  end

  context ".new" do
    it "takes a hash and attributes can be accessed via method missing" do
      c = subject.new(CASE_HASH)

      expect(c.id).to eq 1
      expect(c.status).to eq "open"
      expect(c.type).to eq "email"
    end
  end

  context ".update" do
    it "should add a new label to the case" do
      expect_any_instance_of(OAuth::AccessToken).to receive(:post)
        .with(CASE_POST_URL,
              {labels: "test"}.to_json,
              { 'Accept'=>'application/json', 'Content-Type' => 'application/json', "x-http-method-override" => "PATCH" })
        .and_return(double(code: 200, body: CASE_HASH.to_json))

      subject.update(1, {labels: "test"})
    end
  end
end
