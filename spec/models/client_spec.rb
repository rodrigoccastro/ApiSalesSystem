require 'rails_helper'

RSpec.describe Client, type: :model do

  it '#save' do
    cli = Client.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")    
    expect { cli.save }.to change { Client.count }.by(1)
  end

  it '#lista' do
    arr = []
    for i in 0..5 do
      cli = Client.new(number: "123#{i}", name: "nome#{i}", email: "email#{i}@email.com", phone: "fone#{i}", address: "add#{i}")
      cli.save
      arr[i] = cli.id
    end
    clients = Client.order('created_at DESC');
    clients.each { |obj|
      expect(obj.id).to be > 0
    } 
  end 

  it '#update' do
    cli = Client.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")
    cli.save

    obj = Client.find(cli.id)
    obj.update(number: "123", name: "name-upd", email: "email@email.com", phone: "fone", address: "add")

    obj2 = Client.find(cli.id)
    expect(obj2.name).to eq("name-upd")
  end 

  it '#destroy' do
    cli = Client.new(number: "123", name: "nome", email: "email@email.com", phone: "fone", address: "add")
    cli.save
    expect { cli.destroy }.to change { Client.count }.by(-1)
  end 

end
