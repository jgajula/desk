require 'spec_helper'
require 'fixtures/label_helper'

describe LabelsController, :type => :controller do
  before do
    stub_request(:post, "https://jagadeeshgajula.desk.com/api/v2/labels")
      .with(body: {name: "test", description: "test"})
      .to_return(body: LABEL_HASH.to_json)

    stub_request(:post, "https://jagadeeshgajula.desk.com/api/v2/labels")
      .with(body: {name: "Sample", description: "Sample"})
      .to_return(status: 422, body: LABEL_JSON_MALFORMED)

    stub_request(:get, "https://jagadeeshgajula.desk.com/api/v2/labels").to_return(body: LABELS_JSON_ENTRIES)
  end

  describe "GET index" do
    it "should return all labels" do
      get :index

      expect(assigns(:labels).length).to eq 11

      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    it "should create a new label" do
      post :create, {name: "test", description: "test"}
      expect(response).to redirect_to("/labels")
      expect(flash[:notice]).to eq("Label has been created successfully!")
      expect(response.status).to eq(302)
    end

  end
end