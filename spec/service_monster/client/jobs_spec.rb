require 'spec_helper'

RSpec.describe ServiceMonster::Client::Jobs do

  before do
    @client = ServiceMonster::Client.new
  end

  describe '#jobs' do
    let!(:response) { { body:    fixture('jobs_list.json'),
                        :headers => {
                            :content_type  => "application/json; charset=utf-8",
                            authorization: 'Basic blah' }
    } }


    context 'all records list' do
      before do
        stub_get("jobs").to_return(response)
      end

      it 'should return a list of jobs' do
        @client.jobs
        expect(a_get("jobs")).to have_been_made
      end
    end

    describe 'filtered list of jobs' do
      context 'after a certain date' do
        let!(:filter) { { wField: 'timeStamp', wOperator: 'gt', wValue: '2015-03-19' } }
        let!(:path) { "jobs?wField=#{filter[:wField]}&wOperator=#{filter[:wOperator]}&wValue=#{filter[:wValue]}" }

        before do
          stub_get(path).to_return(response)
        end

        it 'should make request to valid filtering url' do
          @client.jobs(filter)
          expect(a_get(path)).to have_been_made
        end
      end
    end

  end

end
