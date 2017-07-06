<!--
Author: Swagat Dash
Date of creation: 5-7-17
Description: This is the Validation.cfc component of The registerLoginColdFusion Project. It, basically has the functions to
validate the username, userEmail and Password field.
-->
<cfcomponent displayname = "Validation" >
	<cffunction name="validateUserName" access="public" returnType="array">
	    <cfargument name="errorMessageArray" type="array" required="true" />
	    <cfargument name="userName" type="string" required="true" />
		<cfif userName EQ "" OR len(userName) GT 30>
			<cfset arrayAppend(ARGUMENTS.errorMessageArray,'Enter a Name between 1-30 characters')/>
		</cfif>
		<cfreturn ARGUMENTS.errorMessageArray />
	</cffunction>
	<cffunction name="validateUserEmail" access="public" returnType="array">
	    <cfargument name="errorMessageArray" type="array" required="true" />
	    <cfargument name="userEmail" type="string" required="true" />
		<cfif userEmail EQ "" OR NOT isValid("eMail",userEmail)>
			<cfset arrayAppend(ARGUMENTS.errorMessageArray,"Enter a valid email address")/>
		</cfif>
		<cfreturn ARGUMENTS.errorMessageArray />
	</cffunction>
	<cffunction name="validateUserPassword" access="public" returnType="array">
	    <cfargument name="errorMessageArray" type="array" required="true" />
	    <cfargument name="userPassword" type="string" required="true" />
		<cfif trim(userPassword) EQ "" OR len(userPassword) GT 25 OR len(userPassword) LT 9>
			<cfset arrayAppend(ARGUMENTS.errorMessageArray,"Enter a Valid Password between 8-25 characters")/>
		</cfif>
		<cfreturn ARGUMENTS.errorMessageArray />
	</cffunction>
</cfcomponent>