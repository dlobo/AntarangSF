public class IARPFaker {
    public static IARPData[] makeIARPData() {
        IARPData architect = architect();
        IARPData interiorDesigner = interiorDesigner();
        IARPData actor = actor();
        
        return new List<IARPData>{ architect, interiorDesigner, actor};
    }
    
    public static IARPData architect() {
        IARPData architect = new IARPData('Design', 'Architect');
        
        Map<String, List<String>> strings = new Map<String, List<String>>();
        strings.put('Interest', new List<String>{'Artistic', 'Enterprising'});
        strings.put('Aptitude', new List<String>{'Spatial', 'Creative'});
        strings.put('Personality', new List<String>{'Practical', 'Realist', 'Thoughtful'});
        architect.putAllStringData(strings);
        
        Map<String, Boolean> booleans = new Map<String, Boolean>();
        booleans.put('FamilyEarn20K', True);
        booleans.put('FamilySupportEducation', True);
        architect.putAllBooleanData(booleans);
        
        return architect;
    }
    
    public static IARPData interiorDesigner() {
        IARPData interiorDesigner = new IARPData('Design', 'Interior Designer');
        
        Map<String, List<String>> strings = new Map<String, List<String>>();
        strings.put('Interest', new List<String>{'Artistic', 'Realist'});
        strings.put('Aptitude', new List<String>{'Spatial', 'Creative'});
        strings.put('Personality', new List<String>{'Creative', 'Practical', 'Dreamer', 'Impulsive', 'Adventurous', 'Talkative', 'Bold'});
        interiorDesigner.putAllStringData(strings);
        
        return interiorDesigner;        
    }

    public static IARPData actor() {
        IARPData actor = new IARPData('Performing Arts', 'Actor');
        
        Map<String, List<String>> strings = new Map<String, List<String>>();
        strings.put('Interest', new List<String>{'Artistic', 'Enterprising'});
        strings.put('Aptitude', new List<String>{'Verbal', 'Creative'});
        strings.put('Personality', new List<String>{'Practical', 'Extrovert', 'Creative', 'Dreamer', 'Adventurous', 'Talkative', 'Bold'});
        actor.putAllStringData(strings);
        
        Map<String, Boolean> booleans = new Map<String, Boolean>();
        booleans.put('FamilyWomenWork', True);
        actor.putAllBooleanData(booleans);
        
        return actor;
    }

}