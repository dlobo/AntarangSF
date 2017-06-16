@isTest
public class IARPDataMatcherTest {

	static List<IARPData> rules;
	static IARPData actor, architect, designer, mismatch;

	static void setup() {
		rules = IARPFaker.makeIARPData();
		
		actor = IARPFaker.actor();
		architect = IARPFaker.architect();
		designer = IARPFaker.interiorDesigner();
		mismatch = IARPFaker.mismatch();
	}
	
	@isTest
    static void checkDifferent() {
		setup();
		    	
        IARPDataMatcher matcher = new IARPDataMatcher(rules);
        
        System.assertEquals(matcher.match(mismatch), null);
    }
    
	@isTest
    static void checkActor() {
		setup();
		    	
        IARPDataMatcher matcher = new IARPDataMatcher(rules);
              
        System.assertNotEquals(matcher.match(actor, false), null);
        System.assertNotEquals(matcher.match(actor, true), null);
        
    }    
    
}