require 'rails_helper'

RSpec.describe BureauArticle do
  let(:bureau) { create(:bureau) }
  let(:article) { create(:article) }

  context 'when create same records' do
    it 'raises error' do
      create(:bureau_article, bureau:, article:)
      expect { create(:bureau_article, bureau:, article:) }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
