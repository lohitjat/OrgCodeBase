({
	handleClick : function(component, event, helper) {
        var input1 = component.find("myComp").get("v.value");
        var input2 = component.find("myComp2").get("v.value");
        console.log("input1---"+input1);
        console.log("input2---"+input2);
        if(isNaN(input1)){
            alert("Not A number");
            var input1 = component.find("myComp").set("v.value",null);
        }
        else{
            alert("Valid number");
        }
		
	}
})