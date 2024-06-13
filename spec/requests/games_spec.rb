# spec/controllers/games_controller_spec.rb
require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'POST #create' do
    let(:valid_throw) { 'rock' }
    let(:server_throw) { 'paper' }
    let(:winning_combinations) { ['rock', 'paper', 'scissors'] }

    before do
      allow(FetchCurbThrowService).to receive(:call).and_return(server_throw)
      stub_const('WinningCombinations::THROW_SIGNS', winning_combinations)
    end

    it 'returns a successful response' do
      post :create, params: { throw: valid_throw }
      expect(response).to be_successful
    end

    it 'returns the correct result when the server throw is fetched successfully' do
      post :create, params: { throw: valid_throw }
      expect(JSON.parse(response.body)['result']).to eq('You lose!')
      expect(JSON.parse(response.body)['server_throw']).to eq(server_throw)
    end

    it 'returns the correct result when the server throw is nil' do
      allow(FetchCurbThrowService).to receive(:call).and_return(nil)
      post :create, params: { throw: valid_throw }
      expect(winning_combinations).to include(JSON.parse(response.body)['server_throw'])
    end

    it 'handles invalid user throw' do
      post :create, params: { throw: 'invalid_throw' }
      expect(response).to be_successful
      expect(JSON.parse(response.body)['result']).to eq('You lose!')
    end

    it 'handles draw scenario' do
      allow(FetchCurbThrowService).to receive(:call).and_return(valid_throw)
      post :create, params: { throw: valid_throw }
      expect(JSON.parse(response.body)['result']).to eq("It's a draw!")
    end
  end
end
