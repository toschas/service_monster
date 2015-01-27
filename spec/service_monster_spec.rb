require 'spec_helper'

RSpec.describe ServiceMonster do
  after do
    ServiceMonster.reset
  end

  describe ".client" do
    it "should be a ServiceMonster::Client" do
      expect(ServiceMonster.client).to be_a(ServiceMonster::Client)
    end
  end

  describe '#api_key' do
    it 'should return the default api key' do
      expect(ServiceMonster.api_key).to eq(ServiceMonster::Configuration::DEFAULT_API_KEY)
    end
  end

  describe '#api_key=' do
    it 'should set the api key' do
      ServiceMonster.api_key = 'test'
      expect(ServiceMonster.api_key).to eq('test')
    end
  end

  describe '#api_version' do
    it 'should return the default api version' do
      expect(ServiceMonster.api_version).to eq(ServiceMonster::Configuration::DEFAULT_API_VERSION)
    end
  end

  describe '#api_version=' do
    it 'should set the api_version' do
      ServiceMonster.api_version = '/test'
      expect(ServiceMonster.api_version).to eq('/test')
    end
  end

  describe '#adapter' do
    it 'should return the default adapter' do
      expect(ServiceMonster.adapter).to eq(ServiceMonster::Configuration::DEFAULT_ADAPTER)
    end
  end

  describe '#adapter=' do
    it 'should set the adapter' do
      ServiceMonster.adapter = :typhoeus
      expect(ServiceMonster.adapter).to eq(:typhoeus)
    end
  end

  describe '#endpoint' do
    it 'should return the default endpoint' do
      expect(ServiceMonster.endpoint).to eq(ServiceMonster::Configuration::DEFAULT_ENDPOINT)
    end
  end

  describe '#endpoint=' do
    it 'should set the endpoint' do
      ServiceMonster.endpoint = 'http://www.google.com'
      expect(ServiceMonster.endpoint).to eq('http://www.google.com')
    end
  end

  describe '#configure' do
    ServiceMonster::Configuration::VALID_OPTIONS_KEYS.each do |key|
      
      it "should set the #{key}" do
        ServiceMonster.configure do |config|
          config.send("#{key}=", key)
          expect(ServiceMonster.send(key)).to eq(key)
        end
      end
    end
  end
end
