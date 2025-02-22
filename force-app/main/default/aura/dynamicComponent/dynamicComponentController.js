({
	doinit : function(component, event, helper) {
        $A.createComponent(
            "lightning:button",
            {
                "aura:id" :"findableAuraId",
                "label"   : "Click Me",
                "onclick" : component.getReference("c.handleclick")
            },
            function(newButton, status,errorMessage){
            if(status ==="SUCCESS"){
                var body = component.get("v.body");
                body.push(newButton);
                component.set("v.body",body);
                 }
           
        }
        );
		
	},
    handleclick : function(component, event, helper){
        component.destroy();
        component.set("v.message","Function handle click works");
    }
})