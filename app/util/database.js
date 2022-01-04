const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'mariadb.c5scuymgh2ka.eu-west-1.rds.amazonaws.com',
  user: 'root',
  database: 'mariadb',
  password: 'mypassword1993',
});

module.exports = pool.promise();
