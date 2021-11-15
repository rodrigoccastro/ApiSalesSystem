require 'rails_helper'

RSpec.describe Sale, type: :model do

  it '#insert' do
    ct_sale = Sale.count
    ct_pd = Productsale.count
    client1 = Client.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")
    client1.save
    client2 = Client.new(number: "123222", name: "nome22", email: "email@email.com", phone: "fone", address: "add")    
    client2.save
    seller1 = Seller.new(number: "123", name: "nome1", email: "email@email.com", phone: "fone", address: "add")    
    seller1.save
    seller2 = Seller.new(number: "123222", name: "nome1222", email: "email@email.com", phone: "fone", address: "add")    
    seller2.save
    product1 = Product.new(name: "nome1", description: "desc1", value: 10)
    product1.save
    product2 = Product.new(name: "nome2", description: "desc2", value: 20)
    product2.save

    productSale1 = Productsale.new(sale_id: "", product_id: product1.id, value: product1.value, quantity: 2)
    productSale2 = Productsale.new(sale_id: "", product_id: product2.id, value: product2.value, quantity: 4)
    arrProductSales1 = [productSale1,productSale2]

    sale1 = Sale.new(client_id: client1.id, seller_id: seller1.id)
    sale1.productsales = arrProductSales1
    sale1.save

    productSale3 = Productsale.new(sale_id: "", product_id: product1.id, value: product1.value, quantity: 2)
    productSale4 = Productsale.new(sale_id: "", product_id: product2.id, value: product2.value, quantity: 4)
    arrProductSales2 = [productSale3,productSale4]

    sale2 = Sale.new(client_id: client2.id, seller_id: seller2.id)
    sale2.productsales = arrProductSales2
    sale2.save

    expect(Sale.count).to eq(ct_sale+2)
    expect(Productsale.count).to eq(ct_pd+4)
  end

  it '#lista' do
    ct_sale = Sale.count
    client1 = Client.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")
    client1.save
    client2 = Client.new(number: "123222", name: "nome22", email: "email@email.com", phone: "fone", address: "add")    
    client2.save
    seller1 = Seller.new(number: "123", name: "nome1", email: "email@email.com", phone: "fone", address: "add")    
    seller1.save
    seller2 = Seller.new(number: "123222", name: "nome1222", email: "email@email.com", phone: "fone", address: "add")    
    seller2.save
    product1 = Product.new(name: "nome1", description: "desc1", value: 10)
    product1.save
    product2 = Product.new(name: "nome2", description: "desc2", value: 20)
    product2.save

    productSale1 = Productsale.new(sale_id: "", product_id: product1.id, value: product1.value, quantity: 2)
    productSale2 = Productsale.new(sale_id: "", product_id: product2.id, value: product2.value, quantity: 4)
    arrProductSales1 = [productSale1,productSale2]

    sale1 = Sale.new(client_id: client1.id, seller_id: seller1.id)
    sale1.productsales = arrProductSales1
    sale1.save

    productSale3 = Productsale.new(sale_id: "", product_id: product1.id, value: product1.value, quantity: 2)
    productSale4 = Productsale.new(sale_id: "", product_id: product2.id, value: product2.value, quantity: 4)
    arrProductSales2 = [productSale3,productSale4]

    sale2 = Sale.new(client_id: client2.id, seller_id: seller2.id)
    sale2.productsales = arrProductSales2
    sale2.save
    
    arr = Sale.order('created_at DESC')
    expect(arr.size).to eq(ct_sale+2)
  end 

  it '#update' do
    client1 = Client.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")
    client1.save
    client2 = Client.new(number: "123222", name: "nome22", email: "email@email.com", phone: "fone", address: "add")    
    client2.save
    seller1 = Seller.new(number: "123", name: "nome1", email: "email@email.com", phone: "fone", address: "add")    
    seller1.save
    seller2 = Seller.new(number: "123222", name: "nome1222", email: "email@email.com", phone: "fone", address: "add")    
    seller2.save

    product1 = Product.new(name: "nome1", description: "desc1", value: 10)
    product1.save
    product2 = Product.new(name: "nome2", description: "desc2", value: 20)
    product2.save
    productSale1 = Productsale.new(sale_id: "", product_id: product1.id, value: product1.value, quantity: 2)
    productSale2 = Productsale.new(sale_id: "", product_id: product2.id, value: product2.value, quantity: 4)
    arrProductSales1 = [productSale1,productSale2]

    sale1 = Sale.new(client_id: client1.id, seller_id: seller1.id)
    sale1.productsales = arrProductSales1
    sale1.save

    newsale = Hash.new
    newsale[:id] = sale1.id
    newsale[:client_id] = client2.id
    newsale[:seller_id] = seller2.id
    newsale[:created_at] = sale1.created_at
    newsale[:updated_at] = sale1.updated_at
    ret = sale1.update(newsale)
    expect(ret).to eq(true)
  end 

  it '#destroy' do
    client1 = Client.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")
    client1.save
    client2 = Client.new(number: "123222", name: "nome22", email: "email@email.com", phone: "fone", address: "add")    
    client2.save
    seller1 = Seller.new(number: "123", name: "nome1", email: "email@email.com", phone: "fone", address: "add")    
    seller1.save
    seller2 = Seller.new(number: "123222", name: "nome1222", email: "email@email.com", phone: "fone", address: "add")    
    seller2.save

    product1 = Product.new(name: "nome1", description: "desc1", value: 10)
    product1.save
    product2 = Product.new(name: "nome2", description: "desc2", value: 20)
    product2.save
    productSale1 = Productsale.new(sale_id: "", product_id: product1.id, value: product1.value, quantity: 2)
    productSale2 = Productsale.new(sale_id: "", product_id: product2.id, value: product2.value, quantity: 4)
    arrProductSales1 = [productSale1,productSale2]

    sale1 = Sale.new(client_id: client1.id, seller_id: seller1.id)
    sale1.productsales = arrProductSales1
    sale1.save

    ret = Productsale.where(:sale_id => sale1.id).delete_all
    expect(ret).to be > 0

    expect { sale1.destroy }.to change { Sale.count }.by(-1)
  end 

end
