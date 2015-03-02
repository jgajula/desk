require 'spec_helper'
require 'fixtures/case_helper'

describe CasesController, :type => :controller do
  before do
    stub_request(:patch, "https://jagadeeshgajula.desk.com/api/v2/cases/1")
      .with(body: {labels: "test"})
      .to_return(body: CASE_HASH.to_json)
  end

  describe "PUT update" do
    it "should add a label to the case" do
      xhr :put, :update, {id: 1, labels: "test"}
      expect(response.status).to eq(200)
    end
  end
end