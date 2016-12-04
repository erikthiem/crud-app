# Get all customers
get '/customers' do
    customers = Customer.all

    content_type :json
    return customers.to_json
end


# Get a specific customer
get '/customer/:id' do
    id = params[:id]

    customer = Customer.get(id)

	get_item(customer)
end


# Create a new customer
post '/customers' do
    company = params[:company]
    address = params[:address]
    city = params[:city]
	state = params[:state]
	zip = params[:zip]

    customer = Customer.create(:company => company, :address => address, :city => city, :state => state, :zip => zip)

    create_item(customer)
end


# Modify a customer
put '/customer/:id' do
    id = params[:id]
    company = params[:company]
    address = params[:address]
    city = params[:city]
	state = params[:state]
	zip = params[:zip]

    updated_parameters = {:company => company, :address => address, :city => city, :state => state, :zip => zip}

    customer = Customer.get(id)

    update_item(customer, updated_parameters)
end


# Delete a customer
delete '/customer/:id' do
    id = params[:id]

    customer = Customer.get(id)

    delete_item(customer)
end
