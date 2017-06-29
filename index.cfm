<!--
Author: Swagat Dash
Date of creation: 26-6-17
Description: This is the Index page of this project. This page basically has a Sign up form. Which
takes user inputs and redirects the control to a new page.
-->
<!---Form Processing Validation--->
<cfif structKeyExists(FORM,'userSubmit')>
	<!---Server-Side Validation--->
	<cfset VARIABLES.errorMessages = Arraynew(1) />
	<!---UserName Validation--->
	<cfif FORM.userName EQ '' OR len(FORM.userName) GT 30>
		<cfset arrayAppend(VARIABLES.errorMessages,'Enter a Name between 1-30 characters')/>
	</cfif>
	<cfif FORM.userEmail EQ '' OR NOT isValid('eMail',userEmail)>
		<cfset arrayAppend(VARIABLES.errorMessages,'Enter a valid email address')/>
	</cfif>
	<cfif FORM.userPassword EQ '' OR len(FORM.userPassword) GT 25 OR len(FORM.userPassword) LT 9>
		<cfset arrayAppend(VARIABLES.errorMessages,'Enter a Valid Password between 8-25 characters')/>
	</cfif>
	<cfif ArrayisEmpty(VARIABLES.errorMessages)>
		<!---Insert Data into Database--->
		<cfQuery datasource='Project1'>
			INSERT INTO userInfo
			(Name,Email,Password)
			VALUES
		    ('#FORM.userName#','#FORM.userEmail#','#FORM.userPassword#')
		</cfQuery>
		<cfset VARIABLES.userIsInserted = true />
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
<!---Check if there are any errorMessages--->
<cfif isDefined('errorMessages') AND NOT ArrayIsEmpty(errorMessages)>
	<cfloop array = '#errorMessages#' index = 'message'>
			<cfoutput>
				<script type = "text/javascript">
					alert('#message#');
				</script>
			</cfoutput>
	</cfloop>
</cfif>
 <!--SIGN UP-->
		<div class="login-form">
			<cfif isDefined('userIsInserted')>
				<cflocation url = '/thankYou.cfm'>
			<cfelse>
				<div class="head-info">
					<h1>SIGN UP</h1>
					<h2>Hello and Welcome! Register yourself.</h2>
				</div>
				<cfform id = "form-signup" name = "form-signup">
					<li>
						<cfinput id = "uName" type = "text" class = "text" placeholder = "Name" name = "userName" onfocus = "this.value = '';" required = "true" message = "Enter a Name">
					</li>
					<span id = "spnName"></span>
					<li>
						<cfinput id = "uEmail" type = "text" class = "text" placeholder = "Email" name = "userEmail" onfocus = "this.value = '';" required = "true" validate = "eMail">
					</li>
					<span id = "spnEmail"></span>
					<li>
						<cfinput id = "uPassword" type = "password" placeholder = "Password" name = "userPassword"  onfocus = "this.value = '';" required = "true" message = "Enter a Password">
					</li>
					<span id = "spnPassword"></span>
					<div class = "p-container">
								<input id = "submit" name = "userSubmit" type = "submit"  value = "SIGN UP" >
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