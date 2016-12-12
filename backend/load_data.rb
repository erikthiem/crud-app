require 'csv'

require_relative 'models'

customers = Customer.all.destroy!

i = 0

CSV.foreach("data/customers.csv") do |row|
    company = row[0]
    address1 = row[1]
    address2 = row[2]
    address3 = row[3]
    city = row[4]
    state = row[5]
    zip = row[6]
    phone1 = row[7]
    phone2 = row[8]
    fax1 = row[9]
    fax2 = row[10]
    email = row[11]
    website = row[12] 

    customer = Customer.new

    customer.attributes = {:company => company, :address1 => address1, :address2 => address2, :address3 => address3, :city => city, :state => state, :zip => zip, :phone1 => phone1, :phone2 => phone2, :fax1 => fax1, :fax2 => fax2, :email => email, :website => website}

    customer.save

    i = i + 1
    puts "Loaded customer #{i}"
end
