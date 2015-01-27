require 'spec_helper'

RSpec.describe ServiceMonster::Client::Orders do
  
  before do
    @client = ServiceMonster::Client.new
  end

  describe '#orders' do

    before do
      stub_get("orders").to_return(body: fixture('orders_list.json'), :headers => {:content_type => "application/json; charset=utf-8", authorization: 'Basic blah'})
    end

    it 'should return a list of orders' do
      @client.orders
      expect(a_get("orders")).to have_been_made
    end
  end

end
