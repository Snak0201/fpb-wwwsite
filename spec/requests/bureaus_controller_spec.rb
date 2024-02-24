require 'rails_helper'

RSpec.describe BureausController do
  include ApplicationHelper
  let(:bureau) { create(:bureau) }

  describe 'GET /:slug' do
    it 'has right content' do
      get bureau_path(bureau)
      expect(response).to have_http_status(:success)
      expect(response.body).to include bureau.name
      expect(response.body).to include bureau.description
      expect(response.body).to include convert_markdown_into_html(bureau.content)
    end
  end
end
