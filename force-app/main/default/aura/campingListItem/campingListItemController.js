({
    packItem : function(component, event, helper) {
       var getComponent= component.get("v.item");
       getComponent.Packed__c=true; 
       component.set("v.item",getComponent); 
       var btn1= event.getSource();
       document.getElementById(btn1.id).disabled=true; 
    }
})