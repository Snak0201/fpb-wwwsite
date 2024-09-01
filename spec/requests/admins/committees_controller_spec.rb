require 'rails_helper'

RSpec.describe Admins::CommitteesController do
  let(:committee) { create(:committee) }

  describe 'GET /' do
    it 'returns http success' do
      get admin_committees_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_admin_committee_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /:slug/edit/' do
    it 'returns http success' do
      get edit_admin_committee_path(committee)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /:slug/preview/' do
    include ApplicationHelper
    let(:name) { committee.name }
    let(:slug) { committee.slug }
    let(:description) { committee.description }
    let(:content) { committee.content }
    let(:params) do
      { committee: { name:, slug:, description:, content: } }
    end

    context 'when same input' do
      it 'returns http see_other' do
        post(update_preview_admin_committee_path(committee), params:)

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to update_preview_admin_committee_path(committee)
        expect(response.body).to include name
        expect(response.body).to include description
      end
    end

    context 'when update input' do
      let(:name) { '更新後' }
      let(:slug) { 'updated' }
      let(:description) { 'updated bureau' }
      let(:content) { "## updated bureau's content" }

      it 'returns http see_other' do
        post(update_preview_admin_committee_path(committee), params:)

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to update_preview_admin_committee_path(committee)
        expect(response.body).to include name
        expect(response.body).to include description
      end
    end

    context 'with invalid input' do
      let(:name) { nil }
      let(:slug) { nil }
      let(:description) { 'updated bureau' }
      let(:content) { "## updated bureau's content" }

      it 'returns http see_other' do
        post(update_preview_admin_committee_path(committee), params:)

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to update_preview_admin_committee_path(committee)
      end
    end
  end
end
