require 'rails_helper'

RSpec.describe Seller, type: :model do

  it '#save' do
    sel = Seller.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")    
    expect { sel.save }.to change { Seller.count }.by(1)
  end

  it '#lista' do
    arr = []
    for i in 0..5 do
      sel = Seller.new(number: "123#{i}", name: "nome#{i}", email: "email#{i}@email.com", phone: "fone#{i}", address: "add#{i}")
      sel.save
      arr[i] = sel.id
    end
    sellers = Seller.order('created_at DESC');
    sellers.each { |obj|
      expect(obj.id).to be > 0
    } 
  end 

  it '#update' do
    sel = Seller.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")
    sel.save

    obj = Seller.find(sel.id)
    obj.update(number: "123", name: "name-upd", email: "email@email.com", phone: "fone", address: "add")

    obj2 = Seller.find(sel.id)
    expect(obj2.name).to eq("name-upd")
  end 

  it '#destroy' do
    sel = Seller.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")
    sel.save
    expect { sel.destroy }.to change { Seller.count }.by(-1)
  end 

end
