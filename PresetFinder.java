public class PresetFinder{
	
	public static void main(String[] args){
		
		Tree<String> tree = new Tree<String>("Factory"); 
	
		tree.addType("Bass"); 
		tree.addType("Synth Pad"); 
		tree.addType("Synth Lead"); 
		tree.addType("Synth Basic"); 
		tree.addType("Synth Bit"); 
		tree.addType("Plucks"); 
		tree.addType("Acustic"); 
		
		System.out.println(tree.size());
		
		tree.getTypes();
		
		System.out.println(tree.contains("Synth Lead"));
		
		tree.addSubType("Sub Bass", tree.getType("Bass"));
		tree.addSubType("Fingered Bass", tree.getType("Bass"));
		
		System.out.println(tree.getType("Bass").firstChild.nextSibling.data);
		
	}
	
}
