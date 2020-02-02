var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "lambofgod1",
    database: "employees_db"
  });

  connection.connect(function(err) {
    if (err) {
      console.error("error connecting: " + err.stack);
      return;
    }
    console.log("connected as id " + connection.threadId);
    start();
  });
  
  
  function start() {
    inquirer
      .prompt({
        name: "displayOrEdit",
        type: "list",
        message: "Would you like to [Display] or [Edit] the employee list?",
        choices: ["Display", "Edit", "Exit"]
      })
      .then(function(answer) {
        if (answer.displayOrEdit === "Display") {
          display();
        }
        else if(answer.displayOrEdit === "Edit") {
          edit();
        } else{
          connection.end();
        }
      });
  }

  function display(){
      inquirer
        .prompt({
           name: "employeeRoleDepartment",
           type: "list",
           message:  "Would you like to see [Employees], listed [Roles] or [Departments]?",
           choices: ["Employees", "Roles", "Departments"]
        }) 
        .then(function(answer) {
            if(answer.employeeRoleDepartment === "Employees"){
                connection.query("SELECT * FROM employee", function(err, results) {
                    if (err) throw err;
                    console.table(results);
                    start();
                    });
            }
            else if (answer.employeeRoleDepartment === "Roles"){
                connection.query("SELECT * FROM role", function(err, results) {
                    if (err) throw err;
                    console.table(results);
                    start();
                    });
            }
            else if (answer.employeeRoleDepartment === "Departments"){
                connection.query("SELECT * FROM department", function(err, results) {
                    if (err) throw err;
                    console.table(results);
                    start();
                    });
            }
        });
  };

  
  function edit(){
      inquirer  
        .prompt({
            name: "editOptions",
            type: "list",
            message: "Would you like to edit [Employees] [Departments] or [Roles]?",
            choices: ["Employees", "Departments", "Roles"]
        })
        .then(function(answer) {

            if(answer.employeeRoleDepartment === "Employees"){       
                    editEmployees();
            }
            else if (answer.employeeRoleDepartment === "Roles"){
                    editRoles();
            }
            else if (answer.employeeRoleDepartment === "Departments"){
                    editDepartments(); 
            }

        });
  }