<!--
Author: Swagat Dash
Date of creation: 24-6-17
Description: This is the Application.cfc component of The registerLoginColdFusion Project. Here, the session management
session timeout, application timeout, and name of the application is set.It also includes the default error handling function
onError() defined.
-->
<cfcomponent
    output="false"
    hint="Handles application level evnts.">
    <!--- Set up application. --->
    <cfset THIS.Name = "ErrorTest" />
    <cfset THIS.ApplicationTimeout = CreateTimeSpan( 1, 0, 0, 0) />
	<cfset THIS.SessionTimeout = CreateTimeSpan(0,1,0,0) />
    <cfset THIS.SessionManagement = true />
	<!--- <cffunction name="onError" returnType="void">
    	<cfargument name="exception" required=true/>
    	<cfargument name="eventName" type="String" required=true/>
        	<cfoutput>
            	<h2>An unexpected error occurred.</h2>
            	<p>Please provide the following information to technical support:</p>
            	<p>Error Event: #ARGUMENTS.eventName#</p>
            	<p>Error details:#ARGUMENTS.exception#</p>
        	</cfoutput>
	</cffunction> --->
</cfcomponent>