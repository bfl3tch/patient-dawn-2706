require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:events) }
    it { should have_many(:teams).through(:events) }
  end
end
