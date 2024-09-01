require 'rails_helper'

RSpec.describe Admins::CommitteesController do
  let(:committee) { create(:committee) }

  describe 'GET /' do
    it 'returns http success' do
      get admin_committees_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new/' do
    it 'returns http success' do
      get new_admin_committee_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create_preview/' do
    let(:name) { '作成された委員会' }
    let(:slug) { 'created' }
    let(:description) { 'committee.description' }
    let(:content) { 'committee.content' }
    let(:params) do
      { committee: { name:, slug:, description:, content: } }
    end

    context 'with valid params' do
      it 'returns http see_other' do
        post(create_preview_admin_committees_path, params:)

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to create_preview_admin_committees_path
        expect(response.body).to include name
        expect(response.body).to include description
      end
    end

    context 'with invalid params' do
      let(:name) { nil }
      let(:slug) { nil }

      it 'returns http see_other' do
        post(create_preview_admin_committees_path, params:)

        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to create_preview_admin_committees_path
        expect(response.body).to include description
      end
    end
  end

  describe 'POST /' do
    let(:name) { '作成後委員会' }
    let(:slug) { 'created' }
    let(:description) { 'committee.description' }
    let(:content) { 'committee.content' }
    let(:commit) { '作成' }
    let(:params) do
      { committee: { name:, slug:, description:, content: }, commit: }
    end

    context 'with cancel commit' do
      let(:commit) { 'キャンセル' }

      it 'keeps params' do
        post(admin_committees_path, params:)

        expect(response).to have_http_status(:see_other)
        expect(response.body).to include name
        expect(response.body).to include slug
        expect(response.body).to include description
        expect(response.body).to include content
      end
    end

    context 'with update commit' do
      it 'redirects admin bureaus and updates the bureau' do
        post(admin_committees_path, params:)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to admin_committees_path

        target_committee = Committee.first

        expect(target_committee.name).to eq name
        expect(target_committee.slug).to eq slug
        expect(target_committee.description).to eq description
        expect(target_committee.content).to eq content
      end
    end

    context 'with update commit and invalid params' do
      let(:name) { nil }
      let(:slug) { nil }

      it 'raises error message' do
        post(admin_committees_path, params:)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include '名称を入力してください'
        expect(response.body).to include 'Slugを入力してください'
      end
    end
  end

  describe 'GET /:slug/edit/' do
    it 'returns http success' do
      get edit_admin_committee_path(committee)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /:slug/update_preview/' do
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

  describe 'PATCH /:slug/' do
    let(:name) { '更新後委員会' }
    let(:slug) { 'updated' }
    let(:description) { 'committee.description' }
    let(:content) { 'committee.content' }
    let(:commit) { '更新' }
    let(:params) do
      { committee: { name:, slug:, description:, content: }, commit: }
    end

    context 'with cancel commit' do
      let(:commit) { 'キャンセル' }

      it 'keeps params' do
        patch(admin_committee_path(committee), params:)

        expect(response).to have_http_status(:see_other)
        expect(response.body).to include name
        expect(response.body).to include slug
        expect(response.body).to include description
        expect(response.body).to include content
      end
    end

    context 'with update commit' do
      it 'redirects admin bureaus and updates the bureau' do
        patch(admin_committee_path(committee), params:)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to admin_committees_path

        target_committee = Committee.first

        expect(target_committee.name).to eq name
        expect(target_committee.slug).to eq slug
        expect(target_committee.description).to eq description
        expect(target_committee.content).to eq content
      end
    end

    context 'with update commit and invalid params' do
      let(:name) { nil }

      it 'raises error message' do
        patch(admin_committee_path(committee), params:)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include '名称を入力してください'
      end
    end
  end
end
