require 'spec_helper'

RSpec.describe ServiceMonster::Client::Accounts do
  
  before do
    @client = ServiceMonster::Client.new
  end

  describe '#accounts' do

    before do
      stub_get("accounts").to_return(body: fixture('accounts_list.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
    end

    it 'should return a list of accounts' do
      @client.accounts
      expect(a_get("accounts")).to have_been_made
    end
  end

end
