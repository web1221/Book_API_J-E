require 'rails_helper'

describe 'POST /authors', :type => :request do
    context '(valid request)' do
        it 'returns [success message, status code 201]' do
            post '/authors', params: {name: 'Jaime Gensler', age: 22}

            expect(JSON.parse(response.body)['id']).to be_an_instance_of(Integer)
            expect(response).to have_http_status 201
        end
    end

    context '(bad request)' do
        it 'returns [error message, status code 422]' do
            post '/authors', params: {name: '', age: 0}

            expect(JSON.parse(response.body)['message']).to eq 'Validation failed: Name can\'t be blank, Age must be greater than 0'
        end
    end
end
