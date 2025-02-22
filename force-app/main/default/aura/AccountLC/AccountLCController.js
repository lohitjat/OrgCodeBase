({
	doinit : function(component, event, helper) {
        var action = component.get("c.getAccount");
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log(response.getReturnValue());
            console.log(response.getName());
            if(state == "SUCCESS"){
                component.set("v.accList",response.getReturnValue());
            }
            else{
                console.log("I get an error");
            }
        });
        $A.enqueueAction(action);
	}
})