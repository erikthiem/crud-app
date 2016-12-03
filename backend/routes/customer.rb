get '/customers' do
    customers = Customer.all

    content_type :json
    return customers.to_json
end
