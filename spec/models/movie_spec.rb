require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to(:studio) }
    xit { should have_many(:actors).through(:movie_actors)}
  end
end
