require 'spec_helper'
require 'rails_app_helper'

RSpec.describe 'rails_app project' do
  describe 'Rails.root' do
    it 'contains project path in sub directory' do
      expect(Rails.root.to_s).to match(/spec\/rails_app/)
    end
  end

  describe 'Devise settings' do
    subject { Devise.mappings[:user] }
    it { should be_truthy }
  end
end
