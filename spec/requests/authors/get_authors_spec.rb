require 'rails_helper'

describe 'GET /authors', :type => :request do
    it 'returns [all authors, status code 200]' do
        get '/authors'

        expect(JSON.parse(response.body).size).to eq 5
        expect(response).to have_http_status 200
    end
end
