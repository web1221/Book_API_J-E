require 'rails_helper'

describe 'PUT /authors/:id', :type => :request do
    context '(valid request)' do
        it 'returns [success message, status code 200]' do
            author = Author.create!(name: 'Noa Horowitz', age: 35)
            put "/authors/#{author.id}", params: {name: 'Noah Horwitz'}

            expect(JSON.parse(response.body)['message']).to eq 'This author (Noah Horwitz) has been updated successfully.'
            expect(response).to have_http_status 200
        end
    end
    context '(bad requests)' do
        it 'updating non-existent author: returns [error message, status code 404]' do
            put '/authors/0', params: {name: 'Noah Horwitz', age: 35}

            expect(JSON.parse(response.body)['message']).to eq 'Couldn\'t find Author with \'id\'=0'
            expect(response).to have_http_status 404
        end

        it 'updating with invalid parameters: returns [error message, status code 422]' do
            author = Author.create!(name: 'Noah Horwitz', age: 35)
            put "/authors/#{author.id}", params: {name: '', age: 0}

            expect(JSON.parse(response.body)['message']).to eq 'Validation failed: Name can\'t be blank, Age must be greater than 0'
            expect(response).to have_http_status 422
        end
    end
end
