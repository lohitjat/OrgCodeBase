({
	doSave : function(component, event, helper) {
		var action = component.get("c.createContact");
        action.setParams({'contObj':component.get('v.contactObj')});
        action.setCallback(this,function(data){
            component.set('v.contactId',data.getReturnValue())
            var chec = data.getReturnValue();
            console.log(chec);
        });
        $A.enqueueAction(action);
	},
    showContacts : function(component, event, helper) {
		var action = component.get("c.retrieveContacts");
        //action.setParams({'contObj':component.get('v.contactObj')});
        action.setCallback(this,function(data){
            component.set('v.contactList',data.getReturnValue())
        });
        $A.enqueueAction(action);
	},
})