require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#page_title' do
    subject { page_title(title) }

    context 'with title' do
      let(:title) { 'タイトル' }

      it { is_expected.to eq 'タイトル | ほしのなか政府' }
    end

    context 'without title' do
      let(:title) { '' }

      it { is_expected.to eq 'ほしのなか政府' }
    end
  end
end
