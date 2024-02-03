require 'rails_helper'

RSpec.describe ArticlesHelper do
  describe '#convert_markdown_into_html' do
    subject(:html) { convert_markdown_into_html(text) }

    context 'when text includes div tag' do
      let(:text) { '<div class="a">1</div>' }

      it 'ignores div tag' do
        expect(html).to include '<p>1</p>'
      end
    end
  end
end
