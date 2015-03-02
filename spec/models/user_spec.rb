require 'spec_helper'
require 'fixtures/user_helper'

describe User do
  USER_URL = "https://jagadeeshgajula.desk.com/api/v2/users/current"
  LABEL_HEADER = { 'Accept'=>'application/json', 'Content-Type' => 'application/json' }

  before do
    stub_request(:get, USER_URL).to_return(body: USER_JSON_STRING)
  end

  subject { User }
  context ".query" do
    before do
      @user = subject.current_user()
    end

    it "returns a valid user object" do
      expect(@user.class).to eq User
      expect(@user.name).to eq "Jagadeesh Gajula"
    end
  end
end

