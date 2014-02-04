
public class Tree<E extends Comparable<E>> { 
	
	private TreeNode<E> root;
	private int size; 
	
	public Tree(E name){
		root = new TreeNode<E>(name); 
	}
	
	public boolean addType(E data) {
		
		if(root.firstChild == null){
			root.firstChild = new TreeNode<E>(data); 
			size++; 
			return true; 
		} else{
			size++;
			root.firstChild.addType(data); 
			return true; 
		}
		
	}
	
	public TreeNode<E> getType(E data){
		
		if(root.firstChild.data == data){
			return root.firstChild; 
		} else {
			return root.firstChild.getType(data);
		}
		
	}
	
	public void addSubType(E data, TreeNode<E> type){
		
		TreeNode<E> t = root.firstChild; 
		
		if(type == t)
			t.addSubType(data);
		
	}

	public boolean remove(E data) {
		return true;
	}

	public boolean contains(E data) {
		return root.firstChild == null ? false : root.firstChild.contains(data);
	}

	public void clear() {}

	public int size() {
		return size; 
	}
	
	public void getTypes(){
		root.firstChild.getTypes();
	}

	public String toString() {
		return "toString"; 
	}

}
