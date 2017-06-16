@isTest
public class IARPDataTest {

	@isTest
    static void nullConstructor() {
    	IARPData nullIarp = new IARPData();
    	
    	System.assertEquals(nullIarp.sector, null);     
    	System.assertEquals(nullIarp.profession, null);    	 
    }
    
    @isTest
    static void sectorProfConstructor() {
    	IARPData sectData = new IARPData('Sector', 'Profession');
    	
    	System.assertEquals(sectData.sector, 'Sector');
    	System.assertEquals(sectData.profession, 'Profession');
    }
    
    @isTest
    static void fullConstructor() {
    	Map<String, List<String>> strings = new Map<String, List<String>> {
    		'Interests' => new List<String> { 'First I', 'Second I' },
    		'Aptitude' => new List<String> { 'First A' }
    	};
    	
    	Map<String, Boolean> booleans = new Map<String, Boolean> {
    		'AmPresent' => True,
    		'AmAbsent' => False
    	};
    	
    	IARPData data = new IARPData('Sector', 'Profession', strings, booleans);
    	
    	List<String> interest = data.getStringData('Interests');
    	System.assertEquals(interest.get(0), 'First I');
    	System.assertEquals(interest.get(1), 'Second I');
    	
    	System.assertEquals(data.getBooleanData('AmPresent'), True);
    	System.assertEquals(data.getBooleanData('AmAbsent'), False);
    	
    }
    
    @isTest
    static void getPutData() {
    	IARPData data = new IARPData('Sector', 'Profession');
    	
    	data.putStringData('Test Input', new List<String> { 'String 1', 'String 2' });
    	data.putBooleanData('AmPresent', True);
    	data.putBooleanData('AmAbsent', False);
    	
    	List<String> strings = data.getStringData('Test Input');
    	System.assertEquals(strings.get(0), 'String 1');
    	System.assertEquals(strings.get(1), 'String 2');
    	
    	System.assertEquals(data.getBooleanData('AmPresent'), True);
    	System.assertEquals(data.getBooleanData('AmAbsent'), False);    	
    }
}