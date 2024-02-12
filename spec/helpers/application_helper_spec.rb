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

  describe '#convert_markdown_into_html' do
    subject(:html) { convert_markdown_into_html(text) }

    context 'when text includes div tag' do
      let(:text) { '<div class="a">1</div>' }

      it 'ignores div tag' do
        expect(html).to include '<p>1</p>'
      end
    end

    context 'when text is nil' do
      let(:text) { nil }

      it { is_expected.to be_nil }
    end
  end
end
