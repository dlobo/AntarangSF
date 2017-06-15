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
private class IARPFakerTest {

	@isTest
    static void testArchitect() {
		IARPData architect = IARPFaker.architect();
		
		System.assertEquals(architect.sector, 'Design');
		System.assertEquals(architect.profession, 'Architect');       
    }
    
    @isTest
    static void testActor() {
    	IARPData actor = IARPFaker.actor();
    	
    	System.assertEquals(actor.sector, 'Performing Arts');
    	System.assertEquals(actor.profession, 'Actor');
    }
    
    @isTest
    static void testInteriorDesigner() {
    	IARPData inter = IARPFaker.interiorDesigner();
    	
    	System.assertEquals(inter.sector, 'Design');
    	System.assertEquals(inter.profession, 'Interior Designer');    		
    }
    
    @isTest
    static void testMakeFakeData() {
    	List<IARPData> data = IARPFaker.makeIARPData();
    	
    	System.assert(data.size() > 0);
    }
    
}