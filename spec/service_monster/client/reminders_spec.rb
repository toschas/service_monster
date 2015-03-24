require 'spec_helper'

RSpec.describe ServiceMonster::Client::Reminders do
  
  before do
    @client = ServiceMonster::Client.new
  end

  describe '#reminders' do

    before do
      stub_get("reminders").to_return(body: fixture('reminders_list.json'),
                                      :headers => {:content_type => "application/json; charset=utf-8",
                                                   authorization: 'Basic blah'})
    end

    it 'should return a list of reminders' do
      @client.reminders
      expect(a_get("reminders")).to have_been_made
    end
  end

end
