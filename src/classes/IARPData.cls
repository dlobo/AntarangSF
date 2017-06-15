public class IARPData {
    public String sector { get; set; }
    public String profession { get; set; }
    
    public Map<String, List<String>> stringData { get; set; }
    public Map<String, Boolean> booleanData { get; set; }

    public IARPData() {
    	this.sector = null;
    	this.profession = null;
    	
        this.stringData = new Map<String, List<String>> { 
            'Interest' => null, 
            'Aptitude' => null, 
            'Personality' => null
        };
            
        this.booleanData = new Map<String, Boolean> { 
            'Family12th' => False,
            'FamilyWomenWork' => False,
            'FamilyEarn20K'  => False,
            'FamilySupportEducation' => False,
            'Married22Plus' => False,
            'FirstToWork' => False,
            'Work1PlusYear' => False,
            'Calm' => False                
        };
    }
        
    public IARPData(String sector, String profession) {
        this();

        this.sector = sector;
        this.profession = profession;           
    }
    
    public IARPData(String sector, String profession, Map<String, List<String>> stringMap, Map<String, Boolean> booleanMap) {
        this(sector, profession);
        
        this.putAllStringData(stringMap);
        this.putAllBooleanData(booleanMap);     
    }
    
    public String[] getStringData(String key) {
        return this.stringData.get(key);
    }

    public Boolean getBooleanData(String key) {
        return this.BooleanData.get(key);
    }

    public String[] putStringData(String key, String[] data) {
        return this.stringData.put(key, data);
    }

    public Boolean putBooleanData(String key, Boolean data) {
        return this.BooleanData.put(key, data);
    }
    
    public void putAllStringData(Map<String, List<String>> dataMap) {
        this.stringData.putAll(dataMap);
    }

    public void putAllBooleanData(Map<String, Boolean> dataMap) {
        this.booleanData.putAll(dataMap);
    }

}
