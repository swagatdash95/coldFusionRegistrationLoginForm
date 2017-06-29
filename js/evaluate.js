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
	var flag1=0, flag2=0;
	$("#uEmail").keyup(function(event){
				var k = $(this).val();
				var keypressed=(event.which);
				var msg1="", msg2="";
				var s = String.fromCharCode(event.which)
				console.log(s);
				console.log(keypressed);
				if(k.length>40)
				{
					alert("Can not enter more than 40characters");
				}
				else
				if($.trim(k)==="")
				{
					alert("can not Enter spaces in email!");
				}

				if(flag1===0)
				{
					if(keypressed!==16)
						msg1+= "Email must have a '@'!";
					else
					{
						flag1 = 1;
						msg1="";
					}
					$("#spnEmail").css("color","red");
					$("#spnEmail").text(msg1+msg2);

				}
				if(flag2===0)
				{
					if(keypressed!==190)
						msg2+= "Email must have a '.'";
					else
					{
						flag2 = 1;
						msg2="";

					}
					$("#spnEmail").css("color","red");
					$("#spnEmail").text(msg1+msg2);

				}
				if(k==="")
				{
					flag1=0;flag2=0;
					$("#spnEmail").text("");
				}

			});
});