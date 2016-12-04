var vueApp = new Vue({
    
    el: '#vueApp',
    data: {
        message: 'CRUD App'
    }

})

var userSection = new Vue({

    el: '#userSection',
    data: {
        users: []
    },
    mounted: function() {
        var self = this;
        self.getUsers();
    },
    methods: {
        getUsers: function() {
            var self = this;
            $.ajax({
                url: "http://localhost:4567/users",
                contentType: "application/json",
                dataType: "json",
                method: "GET",
                success: function(data) {
                    self.users = data;
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                }
            });
        }
    }
})

var customerSection = new Vue({

    el: '#customerSection',
    data: {
        customers: []
    },
    mounted: function() {
        var self = this;
        self.getCustomers();
    },
    methods: {
        getCustomers: function() {
            var self = this;
            $.ajax({
                url: "http://localhost:4567/customers",
                contentType: "application/json",
                dataType: "json",
                method: "GET",
                success: function(data) {
                    self.customers = data;
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                }
            });
        }
    }
})
