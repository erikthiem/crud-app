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
        new_task_entry: {},

        user_login_info: {},
        logged_in: false

    },

    mounted: function() {

        var self = this;

        self.isLoggedIn();
    },

    methods: {
        
        getAllData: function() {
            var self = this;

            self.getUsers();
            self.getCustomers();
            self.getProjects();
            self.getTasks();
            self.getTaskEntries();
        },

        clearLocalData: function() {
            var self = this;

            self.users = [];
            self.new_user = {};

            self.customers = [];
            self.new_customer = {};

            self.projects = [];
            self.new_project = {};

            self.tasks = [];
            self.new_task = {};

            self.task_entries = [];
            self.new_task_entry = {};

        },

        isLoggedIn: function() {
            var self = this;

            $.ajax({
                url: apiBaseUrl + "/isloggedin",
                contentType: "application/json",
                method: "GET",
                success: function(data) {
                    console.log(data);
                    self.logged_in = data.logged_in;

                    if (self.logged_in)
                        self.getAllData();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                }
            });
        },

        getUsers: function() {
            var self = this;

            $.ajax({
                url: apiBaseUrl + "/users",
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

        deleteUser: function(user) {
            var self = this;

            $.ajax({
                url: apiBaseUrl + "/user/" + user.id,
                dataType: "json",
                method: "DELETE",
                contentType: "application/json",
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

        loginUser: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/user/login",
                dataType: "json",
                method: "POST",
                data: self.user_login_info,
                success: function(data) {
                    console.log(JSON.stringify(data));

                    self.logged_in = true;
                    self.user_login_info = {};
                    self.getAllData();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                }
            });
        },

        logoutUser: function() {
            var self = this;

            $.ajax({
                url: apiBaseUrl + "/user/logout",
                dataType: "json",
                method: "POST",
                success: function(data) {
                    console.log(JSON.stringify(data));

                    self.logged_in = false;
                    self.clearLocalData();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));

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

        addNewCustomer: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/customers",
                data: self.new_customer,
                dataType: "json",
                method: "POST",
                success: function(data) {
                    self.new_customer = {};
                    self.getCustomers();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.new_customer = {};
                    self.getCustomers();
                }
            });
        },

        deleteCustomer: function(customer) {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/customer/" + customer.id,
                contentType: "application/json",
                dataType: "json",
                method: "DELETE",
                success: function(data) {
                    console.log(JSON.stringify(data));
                    self.getCustomers();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.getCustomers();
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

        addNewProject: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/projects",
                data: self.new_project,
                dataType: "json",
                method: "POST",
                success: function(data) {
                    self.new_project = {};
                    self.getProjects();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.new_project = {};
                    self.getProjects();
                }
            });
        },

        deleteProject: function(project) {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/project/" + project.id,
                contentType: "application/json",
                dataType: "json",
                method: "DELETE",
                success: function(data) {
                    console.log(JSON.stringify(data));
                    self.getProjects();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.getProjects();
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

        addNewTask: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/tasks",
                data: self.new_task,
                dataType: "json",
                method: "POST",
                success: function(data) {
                    self.new_task = {};
                    self.getTasks();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.new_task = {};
                    self.getTasks();
                }
            });
        },

        deleteTask: function(task) {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/task/" + task.id,
                contentType: "application/json",
                dataType: "json",
                method: "DELETE",
                success: function(data) {
                    console.log(JSON.stringify(data));
                    self.getTasks();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.getTasks();
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
        },

        addNewTaskEntry: function() {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/task_entries",
                data: self.new_task_entry,
                dataType: "json",
                method: "POST",
                success: function(data) {
                    self.new_task_entry = {};
                    self.getTaskEntries();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.new_task_entry = {};
                    self.getTaskEntries();
                }
            });
        },

        deleteTaskEntry: function(task_entry) {
            var self = this;
            $.ajax({
                url: apiBaseUrl + "/task_entry/" + task_entry.id,
                contentType: "application/json",
                dataType: "json",
                method: "DELETE",
                success: function(data) {
                    console.log(JSON.stringify(data));
                    self.getTaskEntries();
                },
                error: function(error) {
                    console.log(JSON.stringify(error));
                    self.getTaskEntries();
                }
            });
        },
    }
})
