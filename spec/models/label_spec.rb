require 'spec_helper'
require 'fixtures/label_helper'

describe Label do
  LABEL_URL = "https://jagadeeshgajula.desk.com/api/v2/labels"
  LABEL_HEADER = { 'Accept'=>'application/json', 'Content-Type' => 'application/json' }

  before do
    stub_request(:get, LABEL_URL).to_return(body: LABELS_JSON_STRING)
  end

  subject { Label }
  context ".fetch" do
    before do
      @labels = subject.fetch()
    end

    it "returns all labels" do
      expect(@labels.class).to eq Array
      expect(@labels.length).to eq 11
    end

    it "returns an Array of Label objects" do
      @labels.each do |l|
        expect(l.class).to be Label
      end
    end
  end

  context ".new" do
    it "takes a hash and attributes can be accessed via method missing" do
      label = subject.new(LABEL_HASH)

      expect(label.id).to eq 1832423
      expect(label.name).to eq "Abandoned Chats"
      expect(label.description).to eq "Abandoned Chats"
    end
  end

  context ".create" do
    it "should add a new label to the case" do
      expect_any_instance_of(OAuth::AccessToken).to receive(:post)
        .with(LABEL_URL, {name: "test", description: "test"}.to_json, LABEL_HEADER)
        .and_return(double(code: 200, body: LABEL_HASH.to_json))

      @body = subject.create({name: "test", description: "test"})
      expect(@body.class).to be Label
    end
  end
end
