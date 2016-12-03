get '/customers' do
    customers = Customer.all

    content_type :json
    return customers.to_json
end

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
