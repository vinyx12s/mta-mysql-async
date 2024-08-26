# MTA MySQL Connection Example

This resource "mysql-async" demonstrates how to connect to a MySQL database from a Multi Theft Auto: San Andreas (MTA:SA) server. The example includes both server-side and client-side scripts, and uses configuration settings to manage database connectivity and debugging.

## Setup Instructions

### Prerequisites

1. **MTA:SA Server**: Ensure you have a running MTA:SA server.
2. **MySQL Database**: Set up a MySQL database. Make sure you have the necessary credentials and access to it.
3. **MTA MySQL Module**: Ensure that the MySQL module for MTA is installed and properly configured.

### Configuration

1. **Add Your MySQL Configuration to `mysql-async/config.lua`**

   Open your `config.lua` file and Put under the `-- MySQL Configuration ` section Your Info. This configuration will be used by the server-side scripts to connect to the MySQL database.

   ```lua
mysqlConfig = {
    host = "localhost",        -- Database host
    port = 3306,               -- Database port
    dbname = "qbcoreframework_8fdf87", -- Database name
    user = "root",    -- Database username (replace with actual username)
    password = "" -- Database password (replace with actual password)
}

2.  if you are not enable fetchremote in your acl.xml Just Replace False With True

<acl name="Default">
    <right name="function.fetchRemote" access="true"></right>
</acl>

access="false"  To --> access="true"

3. **Restart the Server: Restart your MTA server to apply the changes.**

4. **Test the Setup: Connect to your server, and use the /getplayerdata [playerID] command to test the MySQL connection and data retrieval.**

             **Troubleshooting**
  Connection Issues: Ensure that the MySQL server is running and accessible from the MTA server.
  Configuration Errors: Double-check the mtaserver.conf and config.lua files for correct values and syntax.
  Debugging: Set config.debug to true to enable detailed debug messages for troubleshooting.
  Feel free to modify and expand this README to fit your specific needs or additional instructions.