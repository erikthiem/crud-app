var apiBaseUrl = "http://localhost:4567"

var vueApp = new Vue({
    
    el: '#vueApp',
    data: {
        title: "Admin Page",
        users: [],
        new_user: {},

        customers: [],
        new_customer: {},

        projects: [],
        new_project: {},

        tasks: [],
        new_task: {},

        task_entries: [],
        new_task_entry: {}
    },

    mounted: function() {

        var self = this;
        self.getUsers();
        self.getCustomers();
        self.getProjects();
        self.getTasks();
        self.getTaskEntries();
    },

    methods: {

        getUsers: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/users", contentType: "application/json",
                dataType: "json",
                method: "GET",
                success: function(data) {
                    self.users = data;
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                }
            });
        },

        addNewUser: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/users",
                data: self.new_user,
                dataType: "json",
                method: "POST",
                success: function(data) {
                    self.new_user = {};
                    self.getUsers();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.new_user = {};
                    self.getUsers();
                }
            });
        },

        deleteUser: function(id) {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/user/" + id,
                dataType: "json",
                method: "DELETE",
                success: function(data) {
                    console.log(JSON.stringify(data));
                    self.getUsers();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.getUsers();
                }
            });
        },

        getCustomers: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/customers",
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
        },

        saveNewCustomer: function(customer) {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/customers",
                data: customer,
                dataType: "json",
                method: "POST",
                success: function(data) {
                    var newCustomer = data;
                    console.log(newCustomer);
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                }
            });
        },

        getProjects: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/projects",
                contentType: "application/json",
                dataType: "json",
                method: "GET",
                success: function(data) {
                    self.projects = data;
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                }
            });
        },

        getTasks: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/tasks",
                contentType: "application/json",
                dataType: "json",
                method: "GET",
                success: function(data) {
                    self.tasks = data;
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                }
            });
        },

        getTaskEntries: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/task_entries",
                contentType: "application/json",
                dataType: "json",
                method: "GET",
                success: function(data) {
                    self.task_entries = data;
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                }
            });
        }


    }
})
