require 'securerandom'

def validUser(username, password)
    user = User.first(:username => username)

    if user then

        return user.password == password

    else

        return false

    end
end

def generateSessionCode()
    return SecureRandom.hex
end
