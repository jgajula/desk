require 'spec_helper'
require 'fixtures/case_helper'
require 'fixtures/filter_helper'
require 'fixtures/label_helper'

describe FiltersController, :type => :controller do
  before do
    stub_request(:get, "https://jagadeeshgajula.desk.com/api/v2/filters/2026388/cases").to_return(body: CASES_JSON_STRING)
    stub_request(:get, "https://jagadeeshgajula.desk.com/api/v2/filters").to_return(body: FILTERS_JSON_STRING)
    stub_request(:get, "https://jagadeeshgajula.desk.com/api/v2/labels").to_return(body: LABELS_JSON_ENTRIES)
    stub_request(:get, "https://jagadeeshgajula.desk.com/api/v2/filters/0/cases").to_return(status: 404, body: CASE_JSON_MALFORMED)
  end
  
  describe "GET index" do
    it "finds all the filters and the selected case" do
      get :index

      expect(assigns(:filters).length).to eq 10

      expect(assigns(:labels).length).to eq 11
      
      expect(assigns(:cases).length).to eq 2
      
      expect(response).to render_template("index")
    end
  end
  
  describe "GET show" do
    it "returns cases for a specific filter via ajax" do
      xhr :get, :show, {id: 2026388}

      expect(assigns(:labels).class).to eq Array
      expect(assigns(:labels).length).to eq 11
      
      expect(assigns(:cases).class).to eq Array
      expect(assigns(:cases).length).to eq 2
      
      expect(response).to render_template("show")
    end

  end
end