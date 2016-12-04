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

    if customer then
        response.status = 200
        return customer.to_json
    else
        response.status = 404
    end
end

# Create a new customer
post '/customers' do
    company = params[:company]
    address = params[:address]
    city = params[:city]
	state = params[:state]
	zip = params[:zip]

    customer = Customer.create(:company => company, :address => address, :city => city, :state => state, :zip => zip)

    saveSuccessful = customer.save

    if saveSuccessful then
        response.status = 201
    else
        response.status = 400
    end
end

# Modify a customer
put '/customer/:id' do
    id = params[:id]
    company = params[:company]
    address = params[:address]
    city = params[:city]
	state = params[:state]
	zip = params[:zip]

    customer = Customer.get(id)

    if customer then
        updateSuccessful = customer.update(:company => company, :address => address, :city => city, :state => state, :zip => zip)

        if updateSuccessful then
            response.status = 200
        else
            response.status = 400
        end

    else
        response.status = 404
    end
end

# Delete a customer
delete '/customer/:id' do
    id = params[:id]

    customer = Customer.get(id)
	p customer

    if customer then
        customer.destroy
		p customer
        response.status = 200
    else
        response.status = 404 
    end
end
