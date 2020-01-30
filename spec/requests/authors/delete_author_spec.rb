require 'rails_helper'

describe 'DELETE /authors/:id', :type => :request do
    context '(valid request)' do
        it 'returns [success message, status code 200]' do
            author = Author.create!(name: 'Angela Weber', age: 24)
            delete "/authors/#{author.id}"

            expect(JSON.parse(response.body)['message']).to eq 'Destroyed author: Angela Weber'
            expect(response).to have_http_status 200
        end
    end

    context '(bad request)' do
        it 'returns [error message, status code 404]' do
            delete '/authors/0'
            
            expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Author with \'id\'=0'
            expect(response).to have_http_status 404
        end
    end
end
