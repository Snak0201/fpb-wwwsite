require 'rails_helper'

RSpec.describe Admins::BureausController do
  let!(:bureau) { create(:bureau) }

  describe 'GET /' do
    it 'returns http success' do
      get admin_bureaus_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /:slug/edit/' do
    it 'returns http success' do
      get edit_admin_bureau_path(bureau)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /:slug/preview/' do
    include ApplicationHelper
    let(:name) { bureau.name }
    let(:slug) { bureau.slug }
    let(:description) { bureau.description }
    let(:content) { bureau.content }
    let(:params) do
      { bureau: { name:, slug:, description:, content: } }
    end

    context 'when same input' do
      it 'returns http see_other' do
        post(preview_admin_bureau_path(bureau), params:)

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to preview_admin_bureau_path(bureau)
        expect(response.body).to include name
        expect(response.body).to include description
        expect(response.body).to include convert_markdown_into_html(content)
      end
    end

    context 'when update' do
      let(:name) { '更新後' }
      let(:slug) { 'updated' }
      let(:description) { 'updated bureau' }
      let(:content) { "## updated bureau's content" }

      it 'returns http see_other' do
        post(preview_admin_bureau_path(bureau), params:)

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to preview_admin_bureau_path(bureau)
        expect(response.body).to include name
        expect(response.body).to include description
        expect(response.body).to include convert_markdown_into_html(content)
      end
    end
  end

  describe 'PATCH /:slug/' do
    let(:name) { '更新後' }
    let(:slug) { 'updated' }
    let(:description) { 'updated bureau' }
    let(:content) { '## content of updated bureau' }
    let(:commit) { '更新' }
    let(:params) do
      { bureau: { name:, slug:, description:, content: }, commit: }
    end

    context 'with cancel commit' do
      let(:commit) { 'キャンセル' }

      it 'redirects edit and keeps params' do
        patch(admin_bureau_path(bureau), params:)

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to admin_bureau_path(bureau)
        expect(response.body).to include name
        expect(response.body).to include slug
        expect(response.body).to include description
        expect(response.body).to include content
      end
    end

    context 'with update commit' do
      it 'redirects admin bureaus and updates the bureau' do
        patch(admin_bureau_path(bureau), params:)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to admin_bureaus_path
        expect(Bureau.first.name).to eq name
      end
    end

    context 'with update commit of same info' do
      let(:name) { bureau.name }
      let(:slug) { bureau.slug }
      let(:description) { bureau.description }
      let(:content) { bureau.content }

      it 'redirects admin bureaus and updates the bureau' do
        patch(admin_bureau_path(bureau), params:)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to admin_bureaus_path
      end
    end
  end
end
