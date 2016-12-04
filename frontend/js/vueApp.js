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
                data: self.users,
                dataType: "text json",
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
