require 'tiny_tds'
server = 'geoappdb-sqlsvr.database.windows.net'
database = 'geoappdb'
username = 'geoadmin'
password = 'P@55w0rd1'
client = TinyTds::Client.new username: username, password: password, 
  host: server, port: 1433, database: database, azure: true

puts "Reading data from table"
tsql = "SELECT * FROM INFORMATION_SCHEMA.TABLES;"
result = client.execute(tsql)
result.each do |row|
  puts row
end

#db_admin_password_prod = P@55w0rd1
#db_admin_username_prod = geoadmin
#geoapp_db_connection_string_prod = Server=tcp:geoappdb-sqlsvr.database.windows.net,1433;Initial Catalog=geoappdb;Persist Security Info=False;User ID=geoadmin;Password=P@55w0rd1;MultipleActiveResultSets=False;Encr
#ypt=True;TrustServerCertificate=False;Connection Timeout=30;
#geoapp_db_database_name_prod = geoappdb                                                                   
#geoapp_db_sql_server_fqdn_prod = geoappdb-sqlsvr.database.windows.net     
