require 'spec_helper'
require 'fixtures/label_helper'

describe Label do
  LABEL_URL = "https://jagadeeshgajula.desk.com/api/v2/labels"
  LABEL_HEADER = { 'Accept'=>'application/json', 'Content-Type' => 'application/json' }
  LABEL_POST_URL = "https://jagadeeshgajula.desk.com/api/v2/labels"
  let!(:created_label) { Label.new }
  before do
    stub_request(:get, LABEL_URL).to_return(body: LABELS_JSON_STRING)
    stub_request(:post,LABEL_POST_URL ).to_return(body: created_label.to_json)
  end
  
  subject { Label }
  context ".fetch" do
    before do
      @labels =  subject.fetch()
    end
    
    it "returns all labels" do
      expect(@labels[:entries].class).to eq Array
      expect(@labels[:entries].length).to eq 11
    end
  end

  
  context ".create" do
    it "should add a new label to the case" do
      @body = subject.create({name: "test", description: "test"})
      expect(@body.class).to be Hashie::Deash
    end
  end
end
