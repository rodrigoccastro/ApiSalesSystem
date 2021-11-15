require 'rails_helper'

RSpec.describe Product, type: :model do

  it '#save' do
    prd = Product.new(name: "nome", description: "email@email.com", value: 12.9)    
    expect { prd.save }.to change { Product.count }.by(1)
  end

  it '#lista' do
    arr = []
    for i in 0..5 do
      prd = Product.new(name: "nome", description: "email@email.com", value: 12.9)
      prd.save
      arr[i] = prd.id
    end
    products = Product.order('created_at DESC');
    products.each { |obj|
      expect(obj.id).to be > 0
    } 
  end 

  it '#update' do
    prd = Product.new(name: "nome", description: "email@email.com", value: 12.9)
    prd.save

    obj = Product.find(prd.id)
    obj.update(name: "nome-upd", description: "email@email.com", value: 12.9)

    obj2 = Product.find(prd.id)
    expect(obj2.name).to eq("nome-upd")
  end 

  it '#destroy' do
    prd = Product.new(name: "nome", description: "email@email.com", value: 12.9)
    prd.save
    expect { prd.destroy }.to change { Product.count }.by(-1)
  end 

end
