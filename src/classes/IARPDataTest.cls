/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
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