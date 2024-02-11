require 'rails_helper'

RSpec.describe Admins::AnnouncementsController do
  context 'when not log in' do
    describe 'GET /new' do
      it 'returns http found' do
        get '/admin/announcement/new'
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to new_admin_session_path
      end
    end

    describe 'POST /preview' do
      it 'returns http found' do
        post '/admin/announcement/preview'
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  context 'when log in' do
    let(:admin) { create(:admin) }

    before do
      sign_in admin
    end

    describe 'GET /new' do
      it 'returns http success' do
        get '/admin/announcement/new'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST /preview' do
      let(:content) { '更新後' }
      let(:params) do
        { admins_announcement: { content: } }
      end

      it 'shows announcement preview' do
        post('/admin/announcement/preview', params:)
        expect(response).to have_http_status(:see_other)
        expect(response).to redirect_to preview_admin_announcement_path
        expect(response.body).to include content
      end
    end

    describe 'POST /' do
      let(:content) { '更新後' }
      let(:params) do
        { admins_announcement: { content: }, commit: }
      end

      context 'when no announcements exist' do
        context 'with cancel' do
          let(:commit) { 'キャンセル' }

          it 'redirects new and keeps content' do
            post('/admin/announcement/', params:)
            expect(response).to have_http_status(:see_other)
            expect(response).to redirect_to admin_announcement_path
            expect(response.body).to include content
          end
        end

        context 'with update' do
          let(:commit) { '更新' }

          it 'redirects admin index and create new announcement' do
            post('/admin/announcement/', params:)
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to admin_index_path
            expect(Admins::Announcement.last.content).to eq content
          end
        end
      end

      context 'when an announcement exist' do
        before do
          create(:admins_announcement)
        end

        context 'with update' do
          let(:commit) { '更新' }

          it 'redirects admin index and create new announcement' do
            post('/admin/announcement/', params:)
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to admin_index_path
            expect(Admins::Announcement.last.content).to eq content
          end
        end
      end
    end
  end
end
