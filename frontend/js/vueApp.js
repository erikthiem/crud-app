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
        session: {logged_in: false, username: "", code: ""}

    },

    mounted: function() {

        var self = this;
        self.getAllData();
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

        getUsers: function() {
            var self = this;

            $.ajax({
                url: apiBaseUrl + "/users",
                contentType: "application/json",
                dataType: "json",
                method: "GET",
                data: {"session_code": self.session.code},
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
                data: Object.assign(self.new_user, {"session_code": self.session.code}),
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
                data: {"session_code": self.session.code},
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

                    var user = self.user_login_info.username;
                    var code = data.code;

                    self.session = {logged_in: true, username: user, code: code};

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

            var code = self.session.code; 
            var session = {"session_code": code};

            console.log(self.session.logged_in);

            $.ajax({
                url: apiBaseUrl + "/user/logout",
                dataType: "json",
                method: "POST",
                data: session,
                success: function(data) {
                    console.log(JSON.stringify(data));

                    self.session.logged_in = false;
                    self.session.username = "";
                    self.session.code = "";

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
                data: {"session_code": self.session.code},
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
                data: Object.assign(self.new_customer, {"session_code": self.session.code}),
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
            console.log("Session code: " + self.session.code);
            $.ajax({
                url: apiBaseUrl + "/customer/" + customer.id,
                data: {"session_code": self.session.code},
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
                data: {"session_code": self.session.code},
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
                data: Object.assign(self.new_project, {"session_code": self.session.code}),
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
                data: {"session_code": self.session.code},
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
                data: {"session_code": self.session.code},
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
                data: Object.assign(self.new_task, {"session_code": self.session.code}),
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
                data: {"session_code": self.session.code},
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
                data: {"session_code": self.session.code},
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
                data: Object.assign(self.new_task_entry, {"session_code": self.session.code}),
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
                data: {"session_code": self.session.code},
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
