({
	handleClick : function(component, event, helper) {
        var btn  = event.getSource();
        console.log("btn---"+btn);
        var temp1 = btn.get("v.label");
        console.log("temp1---"+temp1);
        component.set("v.Var1",temp1);
        
       /* var temp = component.get("v.Var1");
        if(temp){
            component.set("v.Var1",null);
        }
        else{
            component.set("v.Var1","ButtonCLick");
        }
        */
		
	},
    handleClick2 : function(component, event, helper) {
        var temp2 = component.get("v.Var2");
          if(temp2){
            component.set("v.Var2",null);
        }
        else{
            component.set("v.Var2","ButtonCLick2");
        }
		
	},
})