({
	parentmethod : function(component, event, helper) {
        var childcmp = component.find("msg");
        component.set("v.ValueInParent",childcmp.get("v.valuefromchild"));
		
	}
})