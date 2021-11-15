require 'rails_helper'

RSpec.describe ProductController, type: :request do
 
  it 'index' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product

    get 'http://localhost:3000/product/'
    expect(response).to have_http_status(200)
  end

  it '#show' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product
    obj = JSON.parse(response.body)["data"]
    id = obj["id"]

    get "http://localhost:3000/product/#{id}/"
    expect(response).to have_http_status(200)
  end 

  it '#create' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product
    expect(response).to have_http_status(200)
  end 

  it '#destroy' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product
    obj = JSON.parse(response.body)["data"]
    id = obj["id"]

    delete "http://localhost:3000/product/#{id}/"
    expect(response).to have_http_status(200)
  end 

  it '#update' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product
    obj = JSON.parse(response.body)["data"]
    id = obj["id"]


    params_product = {name: "nome233", description: "email@email.com", value: "12.5"}
    put "http://localhost:3000/product/#{id}/", params: params_product
    expect(response).to have_http_status(200)
  end 
  
end
