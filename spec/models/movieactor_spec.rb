require 'rails_helper'

RSpec.describe MovieActor, type: :model do
  describe 'relationships' do 
    xit { should have_many :actors}
    xit { should have_many :movies}
  end
end