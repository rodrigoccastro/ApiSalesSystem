require 'rails_helper'

RSpec.describe SellerController, type: :request do

  
  it 'index' do
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller

    get "http://localhost:3000/seller/"
    expect(response).to have_http_status(200)
  end

  it '#show' do
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller
    obj = JSON.parse(response.body)["data"]
    id = obj["id"]

    get "http://localhost:3000/seller/#{id}/"
    expect(response).to have_http_status(200)
  end 

  it '#create' do
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller
    expect(response).to have_http_status(200)
  end 

  it '#destroy' do
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller
    obj = JSON.parse(response.body)["data"]
    id = obj["id"]

    delete "http://localhost:3000/seller/#{id}/"
    expect(response).to have_http_status(200)
  end 

  it '#update' do
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller
    obj = JSON.parse(response.body)["data"]
    id = obj["id"]

    params_seller = {number: "123", name: "nome2", email: "email@email.com", phone: "fone", address: "add"}
    put "http://localhost:3000/seller/#{id}/", params: params_seller
    expect(response).to have_http_status(200)
  end 
  
end
