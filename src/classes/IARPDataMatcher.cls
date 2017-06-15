/**
* This class contains the business logic that drives the matching between a student 
* OMR record converted into the IARP data format, with a one IARP rules data record.
* Matching will be weight based and will use a point system as antarang figures out
* what works in practice
*
* All matches are checked from the standpoint of the rule. We'll probably give a 
* rule-match as a positive score (i.e. present in rule and student data)
* and a student-miss (present in student but not in rule) as a negative score
*/
public class IARPDataMatcher {
	static boolean strictMatch(IARPData rule, IARPData student) {
		Boolean result = true;
		Integer score = 0;

		// first ensure that all string data matches
		Map<String, List<String>> ruleStringData = rule.stringData;
		for (String ruleKey: ruleStringData.keySet()) {
			List<String> ruleList = ruleStringData.get(ruleKey);
			if (ruleList != null && ! ruleList.isEmpty()) { // there are expected values for this keyList
				Set<String> studentSet = new Set<String>(student.stringData.get(ruleKey));
				for (String ruleElement: ruleList) {
					if (studentSet.contains(ruleElement)) {
						score = score + 1;
					}
					else {
						result = false;
					}					
				}
				
			}
		}
		
		Map<String, Boolean> ruleBooleanData = rule.booleanData;
		for (String ruleKey: ruleBooleanData.keySet()) {
			if (ruleBooleanData.get(ruleKey) == student.booleanData.get(ruleKey)) {
				score = score + 1;
			}
			else {
				result = false;
			}
		}
		
		return result;
		
	}
    
}