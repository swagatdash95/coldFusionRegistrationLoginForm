<cfcomponent displayname = "Database">
	<cffunction name="insertDB" access="public" returntype="boolean" >
		<cfargument name="userName" type="string" required="true" />
	    <cfargument name="userEmail" type="string" required="true" />
	   	<cfargument name="userPassword" type="string" required="true" />
		<cfargument name="imageDestination" type="string" required="true" />
	   	<cfQuery datasource="Project1">
			INSERT INTO userInfo
			(Name,Email,Password,ImageURL)
			VALUES
		    (<cfqueryparam value="#trim(ARGUMENTS.userName)#" cfsqltype=“cf_sql_varchar” >,
		     <cfqueryparam value="#trim(ARGUMENTS.userEmail)#" cfsqltype=“cf_sql_varchar” >,
		     <cfqueryparam value="#hash(trim(ARGUMENTS.userPassword))#" cfsqltype=“CF_SQL_LONGVARCHAR”>,
		   	 '#ARGUMENTS.imageDestination#')
		</cfQuery>
		<cfset returnmessage = true>
		<cfreturn returnmessage>
	</cffunction>

	<cffunction name="selectDB" access="public" returntype="query" >
		<cfquery name = "allUsers" datasource = "Project1">
			SELECT * FROM userInfo
		</cfquery>
		<cfreturn allUsers>
	</cffunction>
</cfcomponent>