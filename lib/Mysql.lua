function getSQLData()
    if Config.connect then
		if Config.debugConsole then
			

			


            outputDebugString("Database connection is Enabled.")
			if Config.chatbox then 
				outputChatBox("~g~Database connection is Enabled.")
			end
		else
			-- Disable Debuging
		end
	else
		if Config.debugConsole then
			



            outputDebugString("Database connection is Disabled.")
			if Config.chatbox then 
				outputChatBox("~r~Database connection is Disabled.")
			end
		else
			-- Disable Debuging
		end   
    end
    local dbConfig = mysqlConfig

    if dbConfig then


		if Config.debugConsole then
			
			outputDebugString("MySQL Config found.")
			--local message = "MySQL Config found."
            --disWeebhook(message) 


			if Config.chatbox then 


				outputChatBox("~g~MySQL Config found.")

			end
		else
			-- Disable Debuging
		end 
	else



		if Config.debugConsole then
			
			--local message = "MySQL Config not found."
            --disWeebhook(message) 

			outputDebugString("MySQL Config not found.")

			if Config.chatbox then 

				outputChatBox("~r~MySQL Config not found.")

			end
		else
			-- Disable Debuging
		end 


		
        
        return nil
    end

    -- Construct the connection string based on configuration
    local connectionString = string.format(
        "dbname=%s;host=%s;port=%d",
        dbConfig.dbname,
        dbConfig.host,
        dbConfig.port
    )

    return connectionString, dbConfig.user, dbConfig.password
end
-- Database Connection
function connectToDb()
    local connectionString, user, password = getSQLData()
    if connectionString then


		if Config.debugConsole then
			
			--local message = "Success to get SQL data for connection."
            --disWeebhook(message) 
			outputDebugString("Success to get SQL data for connection.")

			if Config.chatbox then 

				outputChatBox("~g~Success to get SQL data for connection.")

			end
		else
			-- Disable Debuging
		end 


	else

		if Config.debugConsole then
			
			--local message = "Failed to get SQL data for connection."
            --disWeebhook(message) 
			outputDebugString("Failed to get SQL data for connection.")

			if Config.chatbox then 

				outputChatBox("~r~Failed to get SQL data for connection.")

			end
		else
			-- Disable Debuging
		end 


        
        return
    end

    -- Ensure dbConnect is used correctly
    mysqlConnect = dbConnect("mysql", connectionString, user, password)
    if mysqlConnect then




		if Config.debugConsole then
			
			--local message = "[mysql-async] - Connect Success."
           -- disWeebhook(message) 
			outputDebugString("[mysql-async] - Connect Success.")


			if Config.chatbox then 

				outputChatBox("~r~[mysql-async] - Connect Success.")

			end
		else
			-- Disable Debuging
		end 



    else
        

		if Config.debugConsole then
			--local message = "[mysql-async] - Failed to Connect."
           -- disWeebhook(message) 
			outputDebugString("[mysql-async] - Failed to Connect.")


			if Config.chatbox then 

				outputChatBox("~r~[mysql-async] - Failed to Connect.")

			end
		else
			-- Disable Debuging
		end 

		
    end
end


-- Command to check database connection status
function checkdatabase(commandName, thePlayer)
    if not isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Admin")) then
        outputChatBox("~r~You do not have permission to use this command.", thePlayer, 255, 0, 0)
		wait(200)

		if Config.logs then 

			outputDebugString("[mysql-async] - The Player [".. getAccountName(getPlayerAccount(thePlayer)) .. "] Don't Have Access To Command" .. Config.cmd)


			--local message = "[mysql-async] - The Player [".. getAccountName(getPlayerAccount(thePlayer)) .. "] Don't Have Access To Command" .. Config.cmd
            --disWeebhook(message) 

		end
		
        return

	else

		outputChatBox("~r~You have SuccessFully use this command.", thePlayer, 255, 0, 0)
		wait(200)
		if Config.logs then 



			--local message = "[mysql-async] - The Player [".. getAccountName(getPlayerAccount(thePlayer)) .. "] Use The Command" .. Config.cmd
            --disWeebhook(message) 

			outputDebugString("[mysql-async] - The Player [".. getAccountName(getPlayerAccount(thePlayer)) .. "] Use The Command" .. Config.cmd)

		end


    end
    
    if getConnection() then
        outputChatBox("~g~Database connection is active and working.", thePlayer, 0, 255, 0)
    else
        outputChatBox("~r~Database connection is not available.", thePlayer, 255, 0, 0)
    end
end

addCommandHandler(Config.cmd, checkdatabase)
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), connectToDb, false)

function getConnection()
    return mysqlConnect
end










-- New Update To add discord Webhook









