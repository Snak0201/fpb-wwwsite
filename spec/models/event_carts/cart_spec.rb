require 'rails_helper'

RSpec.describe EventCarts::Cart do
  let(:cart) { create(:'event_carts/cart') }
  let(:other_cart) { create(:'event_carts/cart') }

  describe '#total_budget' do
    subject { cart.total_budget }

    context 'when records include nil and other cart' do
      before do
        create_list(:'event_carts/mark', 8, budget: 1000, cart:)
        create_list(:'event_carts/mark', 2, cart:)
        create_list(:'event_carts/mark', 4, budget: 100)
      end

      it { is_expected.to eq 8000 }
    end
  end
end
