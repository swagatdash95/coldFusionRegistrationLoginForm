$(document).ready(function() {
	var errors = [""];
	
	
	$("#uPassword").keyup(function(){
				var x= $("#uPassword").val();
				if($.trim(x)==="")
				{
					$("#spnPassword").css("color","red");
					$("#spnPassword").text("cant Enter just spaces");
				}
				else
				if(x.length < 9 || x.length > 25)
				{
					$("#spnPassword").css("color","red");
					$("#spnPassword").text("No. of characters must be between 9-25");
				}
				else
				{
					$("#spnPassword").text(" ");
				}
				if(x ===""){
					$("#spnPassword").text(" ");
				}
			});

	$("#uName").keyup(function(event){
				var k= $("#uName").val();
				var keypressed=event.which;
				var pattern = "^[A-Za-z\s]+$";
				if(k.length>30)
				{
					alert("Can not enter more than 30 characters");
				}
				else
				if($.trim(k)==="")
				{
					$("#spnName").css("color","red");
					$("#spnName").text("cant Enter just spaces");
				}
				else
				if(!(k.match(pattern)))
				{
					$("#spnName").css("color","red");
					$("#spnName").text("Enter only alphabets");
				}
				else
				{
					$("#spnName").text("");

				}
				if(k==="")
				{
					$("#spnName").text("");
				}

			});
	$("#uEmail").keyup(function(event){
				var l = $("#uEmail").val();
				var keypressed=(event.which);
				var pattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$" ;
				if(l.length>40)
				{
					alert("Can not enter more than 40 characters");
				}
				else
				if(keypressed===32)
				{
					alert("can not Enter spaces in email!");
				}
				if(l.match(pattern))
				{
					$("#spnEmail").text("");
				
				}
				else
				{
					$("#spnEmail").css("color","red");
					$("#spnEmail").text("Please Enter a valid email address!");
				}
				if(l==="")
				{
					$("#spnEmail").text("");
				}
			});
	$("#submit").click(function(event){
			
				var x= $("#uPassword").val();
				var l = $("#uEmail").val();
				var k= $("#uName").val();
				var pattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$" ;
				var pattern1 = "^[A-Za-z\s]+$";
				var returnVal = true;
				var z = $("#uPhoto").val();
				console.log(z);
				if(k.length>30)
				{
					$("#spnName").css("color","red");
					$("#spnName").text("* cant Enter more than 30 characters");
					returnVal = false;
				}
				else
				if($.trim(k)==="")
				{
					$("#spnName").css("color","red");
					$("#spnName").text("* Mandatory Field!");
					returnVal = false;
				}
				else
				if(!(k.match(pattern1)))
				{
					$("#spnName").css("color","red");
					$("#spnName").text("* Enter only alphabets");
					returnVal = false;
				}
				if($.trim(x)==="")
				{
					$("#spnPassword").css("color","red");
					$("#spnPassword").text("* Mandatory Field!");
					returnVal = false;
				}
				else
				if(x.length < 9 || x.length > 25)
				{
					$("#spnPassword").css("color","red");
					$("#spnPassword").text("* No. of characters must be between 9-25");
					returnVal = false;
				}
				
				if(l.length>40)
				{
					$("#spnEmail").css("color","red");
					$("#spnEmail").text("* Can not enter more than 40 characters!");
					returnVal = false;
				}
				else
				if(!(l.match(pattern)))
				{
					$("#spnEmail").css("color","red");
					$("#spnEmail").text("* Please Enter a valid email address!");
					returnVal = false;
				}
				if($.trim(z)=="")
				{
					$("#spnPhoto").css("color","red");
					$("#spnPhoto").text("* Mandatory Field!");
					returnVal = false;
					
				}
				return returnVal;
			});
});