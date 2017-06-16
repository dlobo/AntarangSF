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
	
	public List<IARPData> rules { get; set; }
		
	public IARPDataMatcher(List<IARPData> rules) {
		this.rules = rules;
	}
	
	public List<IARPDataMatch> match(IARPData student) {
		return this.match(student, false);
	}
	
	public List<IARPDataMatch> match(IARPData student, Boolean strict) {
		List<IARPDataMatch> matches = new List<IARPDataMatch>();
		
		for (Integer i = 0; i < this.rules.size(); i++) {
			IARPDataMatch result = this.matcher(this.rules[i], student, strict);
			if (result != null) {
				matches.add(result);
			}			
		}
		
		if (matches.size() > 0) {
			return matches;
		}
		return null;
	}
	
	public IARPDataMatch matcher(IARPData rule, IARPData student) {
		return this.matcher(rule, student, false);
	}
	
	public IARPDataMatch matcher(IARPData rule, IARPData student, Boolean strict) {
		Boolean strictMatch = true;
		Integer score = 0;

		// first ensure that all string data matches
		Map<String, List<String>> ruleStringData = rule.stringData;
		for (String ruleKey: ruleStringData.keySet()) {
			List<String> ruleList = ruleStringData.get(ruleKey);
			List<String> studentList = student.stringData.get(ruleKey);
			
			if (ruleList != null && ! ruleList.isEmpty()) { // there are expected values for this keyList
				if (studentList == null) {
					strictMatch = false;
				}
				else {
					Set<String> studentSet = new Set<String>(student.stringData.get(ruleKey));
					for (String ruleElement: ruleList) {
						if (studentSet.contains(ruleElement)) {
							score = score + 1;
						}
						else {
							strictMatch = false;
						}					
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
				strictMatch = false;
			}
		}
		
		IARPDataMatch result = null;
		if (strict) {
			if (strictMatch) {
				result = new IARPDataMatch(rule, score, strictMatch);
			}
		}
		else if (score > 0 || strictMatch) {
			if (strict && strictMatch) {
				result = new IARPDataMatch(rule, score, strictMatch);
			}
		}
		
		return result;	
	}
    
}