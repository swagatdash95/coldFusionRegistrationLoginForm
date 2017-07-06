<!--
Author: Swagat Dash
Date of creation: 28-6-17
Description: This is the page displayed to the user on logging out of the homepage. This again has the Signin functionality
in-case the user wants to sign back in.
-->
<cfset StructClear(SESSION)>
<cflogout Session="current">
<cfif structKeyExists(FORM,'userLogin')>
	<cfquery name = "allUsers" datasource="Project1">
		SELECT * FROM userInfo
	</cfquery>
	<cfloop query = "allUsers">
		<cfif FORM.userEmail EQ #allUsers.Email#>
			<cfset userValid = 1 />
			<cfset userPass = #allUsers.Password#>
			<cfset SESSION.validUserName = #allUsers.Name#>
			<cfset SESSION.imageURL = #allUsers.ImageURL#>
			<cfbreak>
		<cfelse>
			<cfset userValid = 0 />
		</cfif>
	</cfloop>
	<cfif userValid EQ 1>
		<cfif hash(FORM.userPassword) EQ #userPass#>
			<cflocation url = '\hi.cfm' addtoken = "false">
		<cfelse>
			<cfoutput>
				<script type = "text/javascript">
					alert('Incorrect Password');
				</script>
			</cfoutput>
		</cfif>
	<cfelse>
		<cflocation url = '\notRegistered.cfm'>
	</cfif>
</cfif>
<!DOCTYPE html>
<html>
<head>
<title>Sign-In</title>
<meta name = "viewport" content="width=device-width, initial-scale=1">
<script type = "application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name = "keywords" content="Flat Trendy Signup Forms Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href = "css/style.css" rel='stylesheet' type='text/css' />
<!--webfonts-->
<link href = 'http://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link href = 'http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,700,800' rel='stylesheet' type='text/css'>
<!--//webfonts-->
<script src = "//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
</head>
<body>
 <!--SIGN IN-->
	<div class = "login-form-1">
		<div class = "head-info">
			<h1>Successfully Logged Out</h1>
			<h3>SIGN IN AGAIN?</h3>
		</div>
		<cfform id = "form-signIn" name = "form-signIn">
			<li>
				<cfinput type = "text" name = "userEmail" class = "text" placeholder = "Email" onfocus = "this.value = '';" >
			</li>
			<li>
				<cfinput type = "password" name = "userPassword" placeholder = "Password" onfocus = "this.value = '';">
			</li>
			<div class = "p-container">
				<cfinput type = "submit" name = "userLogin" value = "SIGN IN" >
			</div>
		</cfform>
		<div class = "social-icons">
			<div class = "but-bottom">
			<a href = "index.cfm" class = "trouble"><p>Need to sign up?</p></a>
			</div>
		</div>
	</div>
 <!--/SIGN IN-->
</body>
</html>