require 'rails_helper'

describe 'GET /authors/:id', :type => :request do
    context '(valid request)' do
        it 'returns [specific author, status code 200]' do
            author = Author.create!(name: 'Eliza Sohn', age: 34)
            get "/authors/#{author.id}"

            expect(JSON.parse(response.body)['name']).to eq 'Eliza Sohn'
            expect(response).to have_http_status 200
        end
    end

    context '(bad request)' do
        it 'returns [error message, status code 404]' do
            get '/authors/0'

            expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Author with \'id\'=0'
            expect(response).to have_http_status 404
        end
    end
end
