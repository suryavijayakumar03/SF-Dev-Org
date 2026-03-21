// List all available SObjects in the Salesforce org
Map<String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();
List<String> objectNames = new List<String>(globalDescribe.keySet());
objectNames.sort();

System.debug('===== AVAILABLE SALESFORCE OBJECTS =====');
System.debug('Total Objects: ' + objectNames.size());
System.debug('');

for(String objName : objectNames) {
    Schema.DescribeSObjectResult objDescribe = globalDescribe.get(objName).getDescribe();
    String label = objDescribe.getLabel();
    Boolean isCustom = objDescribe.isCustom();
    Boolean isAccessible = objDescribe.isAccessible();
    
    System.debug(objName + ' | Label: ' + label + ' | Custom: ' + isCustom + ' | Accessible: ' + isAccessible);
}

System.debug('');
System.debug('===== END OF LIST =====');
