require 'rails_helper'

RSpec.describe "Api::Pets", type: :request do
  include Committee::Rails::Test::Methods

  def committee_options
    @committee_options ||= {
      schema_path: schema_path,
    }
  end

  def schema_path
    Rails.root.join('apidocs', 'openapi.json').to_s
  end

  describe "GET /api/pets" do
    it 'レスポンスがAPIドキュメントと一致する' do
      get '/api/pets/1'
      assert_schema_conform
    end
  end
end
