@RestResource(urlMapping='/GetDependentPicklistValues/*')
global with sharing class DependentPicklistWebservice {
	
	public DependentPicklistWebservice(){		
	}
	
	global class RequestParam{
		String objectApi;
		String controllingField;
		String dependentField;
	}
	
	@HttpPost
	global static Map<String,List<String>> webservicePostCallout(RequestParam parameters){
		String objectApi_Name = parameters.objectApi.toLowerCase();
		String controllingField_Name = parameters.controllingField.toLowerCase();
		String dependentField_Name = parameters.dependentField.toLowerCase();
		
		PicklistFieldController controller = new PicklistFieldController();
		Map<String,List<String>> valueMap = controller.getDependentOptionsImpl(objectApi_Name,controllingField_Name,dependentField_Name);
		return valueMap;
	}
}