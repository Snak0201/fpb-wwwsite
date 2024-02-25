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
    subject { convert_markdown_into_html(text) }

    context 'when text includes div tag' do
      let(:text) { '<div class="a">1</div>' }

      it { is_expected.to include '<div class="a">1</div>' }
    end

    context 'when text includes span tag' do
      let(:text) { '<span class="x">2</span>' }

      it { is_expected.to include '<span class="x">2</span>' }
    end

    context 'when text includes script tag' do
      let(:text) { '<script>3</script>' }

      it { is_expected.to include '3' }
    end

    context 'when text is nil' do
      let(:text) { nil }

      it { is_expected.to be_nil }
    end
  end
end
