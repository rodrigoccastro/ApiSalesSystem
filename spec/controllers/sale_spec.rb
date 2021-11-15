require 'rails_helper'

RSpec.describe SaleController, type: :request do
 
  it 'index' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product
    obj = JSON.parse(response.body)["data"]
    product_id = obj["id"]
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client
    obj = JSON.parse(response.body)["data"]
    client_id = obj["id"]
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller
    obj = JSON.parse(response.body)["data"]
    seller_id = obj["id"]

    params_productsales = [ {product_id: product_id, value: "12.5", quantity: "2"} ]
    params_sale = {client_id: client_id, seller_id: seller_id, productsales: params_productsales}
    post 'http://localhost:3000/sale/', params: params_sale
    
    get 'http://localhost:3000/sale/'
    expect(response).to have_http_status(200)
  end

  it '#show' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product
    obj = JSON.parse(response.body)["data"]
    product_id = obj["id"]
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client
    obj = JSON.parse(response.body)["data"]
    client_id = obj["id"]
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller
    obj = JSON.parse(response.body)["data"]
    seller_id = obj["id"]

    params_productsales = [ {product_id: product_id, value: "12.5", quantity: "2"} ]
    params_sale = {client_id: client_id, seller_id: seller_id, productsales: params_productsales}
    post 'http://localhost:3000/sale/', params: params_sale
    obj = JSON.parse(response.body)["data"]
    id = obj[0]["sale"]["id"]

    get "http://localhost:3000/sale/#{id}/"
    expect(response).to have_http_status(200)
  end 

  it '#create' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product
    obj = JSON.parse(response.body)["data"]
    product_id = obj["id"]
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client
    obj = JSON.parse(response.body)["data"]
    client_id = obj["id"]
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller
    obj = JSON.parse(response.body)["data"]
    seller_id = obj["id"]

    params_productsales = [ {product_id: product_id, value: "12.5", quantity: "2"} ]
    params_sale = {client_id: client_id, seller_id: seller_id, productsales: params_productsales}
    post 'http://localhost:3000/sale/', params: params_sale
    expect(response).to have_http_status(200)
  end 

  it '#destroy' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product
    obj = JSON.parse(response.body)["data"]
    product_id = obj["id"]
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client
    obj = JSON.parse(response.body)["data"]
    client_id = obj["id"]
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller
    obj = JSON.parse(response.body)["data"]
    seller_id = obj["id"]

    params_productsales = [ {product_id: product_id, value: "12.5", quantity: "2"} ]
    params_sale = {client_id: client_id, seller_id: seller_id, productsales: params_productsales}
    post 'http://localhost:3000/sale/', params: params_sale
    obj = JSON.parse(response.body)["data"]
    id = obj[0]["sale"]["id"]

    delete "http://localhost:3000/sale/#{id}/"
    expect(response).to have_http_status(200)
  end 

  it '#update' do
    params_product = {name: "nome", description: "email@email.com", value: "12.5"}
    post 'http://localhost:3000/product/', params: params_product
    obj = JSON.parse(response.body)["data"]
    product_id = obj["id"]
    params_client = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/client/", params: params_client
    obj = JSON.parse(response.body)["data"]
    client_id = obj["id"]
    params_seller = {number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add"}
    post "http://localhost:3000/seller/", params: params_seller
    obj = JSON.parse(response.body)["data"]
    seller_id = obj["id"]

    params_productsales = [ {product_id: product_id, value: "12.5", quantity: "2"} ]
    params_sale = {client_id: client_id, seller_id: seller_id, productsales: params_productsales}
    post 'http://localhost:3000/sale/', params: params_sale
    obj = JSON.parse(response.body)["data"]
    id = obj[0]["sale"]["id"]
    
    params_productsales = [ {product_id: product_id, value: "12.5", quantity: "2"} ]
    params_sale = {client_id: client_id, seller_id: seller_id, productsales: params_productsales}
    put "http://localhost:3000/sale/#{id}/", params: params_sale
    expect(response).to have_http_status(200)
  end 
  
end
