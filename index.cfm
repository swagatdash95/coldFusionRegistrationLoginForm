<!--
Author: Swagat Dash
Date of creation: 26-6-17
Description: This is the Index page of this project. This page basically has a Sign up form. Which
takes user inputs and redirects the control to a new page.
-->
<!---Form Processing Validation--->
<cfif structKeyExists(FORM,"userSubmit")>
	<cfquery name = "allUsers" datasource = "Project1">
			SELECT * FROM userInfo
	</cfquery>
	<cfloop query = "VARIABLES.allUsers">
		<cfif FORM.userEmail EQ #allUsers.Email#>
			<cfoutput>
				<script type = "text/javascript">
					alert("USER ALREADY SIGNED UP! Please log-in.");
				</script>
			</cfoutput>
		</cfif>
	</cfloop>
	<!---Server-Side Validation--->
	<cfset VARIABLES.errorMessages = Arraynew(1) />

	<cfinvoke component="components/Validation"
        method="validateInputs"
        returnVariable="VARIABLES.errorMessages">
    	<cfinvokeargument name="errorMessageArray" value="#VARIABLES.errorMessages#">
		<cfinvokeargument name="userName" value="#FORM.userName#">
		<cfinvokeargument name="userEmail" value="#FORM.userEmail#">
		<cfinvokeargument name="userPassword" value="#FORM.userPassword#">
	</cfinvoke>

	<cfif structKeyExists(form,"userPhoto")>
		<cftry>
			<cffile action="upload" destination= #ExpandPath('./images')# filefield="userPhoto" nameconflict="makeunique" accept="image/jpeg" result="photoResult">
		<cfcatch type="any">
		   		<!--- file is not written to disk if error is thrown  --->
		    	<!--- prevent invalid file types --->
		    	<cfif FindNoCase("The MIME type or the Extension of the uploaded file", cfcatch.message)>
		        	<cfabort showerror="<b>Invalid file type.Please Upload JPEG file only</b>" />

		    	<!--- prevent empty form field --->
		   		<cfelseif FindNoCase("did not contain a file.", cfcatch.message)>
		        	<cfabort showerror="<b>Empty form field. Please Upload a File!</b>" />

		    	<!---all other errors --->
		    	<cfelse>
		        	<cfabort showerror="<b>File Upload Error</b>" />

		    	</cfif>
		</cfcatch>
		</cftry>
		<cfset VARIABLES.imageDestination = "#photoResult.SERVERDIRECTORY#\" & "#photoResult.SERVERFILE#">
	<cfelse>
		<cfset VARIABLES.imageDestination = "NULL">
	</cfif>
	<cfif ArrayisEmpty(VARIABLES.errorMessages)>
		<!---Insert Data into Database--->
		<cfinvoke component="components/Database"
	        method="insertDB"
	        returnVariable="VARIABLES.returnVal">
	    	<cfinvokeargument name="userName" value="#FORM.userName#">
			<cfinvokeargument name="userEmail" value="#FORM.userEmail#">
			<cfinvokeargument name="userPassword" value="#FORM.userPassword#">
			<cfinvokeargument name="imageDestination" value="#VARIABLES.imageDestination#">
		</cfinvoke>
		<cfif "#VARIABLES.returnVal#" EQ true>
			<cfset VARIABLES.userIsInserted=true />
		</cfif>
	</cfif>
</cfif>
<!DOCTYPE html>
<html>
<head>
<title>USER SIGN-UP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Flat Trendy Signup Forms Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!--webfonts-->
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,700,800' rel='stylesheet' type='text/css'>
<!--//webfonts-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body>
	<cfset VARIABLES.messages = "">
	<!---Check if there are any errorMessages--->
	<cfif isDefined("errorMessages") AND NOT ArrayIsEmpty(errorMessages)>
		<cfset i = 1>
		<cfloop array = "#errorMessages#" index = "message">
			<cfset VARIABLES.messages = messages &"  #i#. "&"#message#">
			<cfset i = i+1>
		</cfloop>
		<cfoutput>
			<script type = "text/javascript">
				alert("#messages#");
			</script>
		</cfoutput>
	</cfif>
	 <!--SIGN UP-->
			<div class="login-form">
				<cfif isdefined("userIsInserted")>
					<cflocation url = "/thankYou.cfm">
				<cfelse>
					<div class="head-info">
						<h1>SIGN UP</h1>
						<h2>Hello and Welcome! Register yourself.</h2>
					</div>
					<cfform id = "form-signup" name = "form-signup" enctype="multipart/form-data">
						<li>
							<cfinput id = "uName" type = "text" class = "text" placeholder = "Name" name = "userName" required = "true" message = "Enter a Name" autocomplete="off">
						</li>
						<span id = "spnName" style="font-size:10px;"></span>
						<li>
							<cfinput id = "uEmail" type = "text" class = "text" placeholder = "Email" name = "userEmail" required = "true" validate = "eMail" autocomplete="off">
						</li>
						<span id = "spnEmail" style="font-size:10px;"></span>
						<li>
							<cfinput id = "uPassword" type = "password" placeholder = "Password" name = "userPassword"  required = "true" message = "Enter a Password">
						</li>
						<span id = "spnPassword" style="font-size:10px;"></span>
						<li style = none>
							<label for="file">Enter your JPEG Photo:</label>
							<cfinput id = "uPhoto" type = "file" value = "Your JPEG Image" name = "userPhoto" style = "margin:top = 0px">
						</li>
						<span id = "spnPhoto" style="font-size:10px;"></span>
						<div class = "p-container">
									<cfinput id = "submit" name = "userSubmit" type = "submit"  value = "SIGN UP" >
						</div>
					</cfform>
					<div class = "social-icons">
						<div class = "but-bottom">
							<a href = "signIn.cfm" class = "account"><p>Already have an account?</p></a>
						</div>
					</div>
				</cfif>
			</div>
	 <!--/SIGN UP-->
<script language = "javascript" src = "../js/evaluate.js"></script>
</body>
</html>