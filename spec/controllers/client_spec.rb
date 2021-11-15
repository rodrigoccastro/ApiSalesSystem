require 'rails_helper'

RSpec.describe ClientController, type: :request do
 
  it 'index' do
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client

    get "http://localhost:3000/client/"
    expect(response).to have_http_status(200)
  end

  it '#show' do
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client
    obj = JSON.parse(response.body)["data"]
    id = obj["id"]

    get "http://localhost:3000/client/#{id}/"
    expect(response).to have_http_status(200)
  end 

  it '#create' do
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client
    expect(response).to have_http_status(200)
  end 

  it '#destroy' do
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client
    obj = JSON.parse(response.body)["data"]
    id = obj["id"]

    delete "http://localhost:3000/client/#{id}/"
    expect(response).to have_http_status(200)
  end 

  it '#update' do
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client
    obj = JSON.parse(response.body)["data"]
    id = obj["id"]

    params_client = {number: "123", name: "nome2", email: "email@email.com", phone: "fone", address: "add"}
    put "http://localhost:3000/client/#{id}/", params: params_client
    expect(response).to have_http_status(200)
  end 
  
end
