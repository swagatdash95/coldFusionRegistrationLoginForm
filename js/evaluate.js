$(document).ready(function() {
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
				var k = $("#uName").val();
				var keypressed=event.which;
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
				if(!(keypressed>=65 && keypressed<=90 || keypressed>=97 && keypressed<=122 || keypressed===32 || keypressed===8))
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
	$("#uEmail").keydown(function(event){
				var k = $("#uEmail").val();
				var keypressed=(event.which);
				var pattern = \b[A-Z0-9._]+@[A-Z0-9._]+\.[A-Z]{2,}\b ;
				var result = pattern.match(k)
				if(k.length>40)
				{
					alert("Can not enter more than 40 characters");
				}
				else
				if(keypressed===32)
				{
					alert("can not Enter spaces in email!");
				}
				
				if(result==true)
				{
					$("#spnEmail").text("");
				
				}
				else
				{
					$("#spnEmail").css("color","red");
					$("#spnEmail").text("Please Enter a valid email address!");
					
				}
				if(k==="")
				{
					$("#spnEmail").text("");
				}

			});
});