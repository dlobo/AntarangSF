public class IARPDataMatch {
	public IARPData rule { get; set; }
	public Integer score  { get; set; }
	public Boolean strictMatch { get; set; }
    
    public IARPDataMatch(IARPData rule, Integer score, Boolean strictMatch) {
    	this.rule = rule;
    	this.score = score;
    	this.strictMatch = strictMatch;
    }
}