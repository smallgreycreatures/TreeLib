package tree;

/**
 * Denna klass representerar ett binärt sökträd. Ni får inte ändra *NÅGOT* i
 * denna klass. Alla ändringar som krävs för att klassen ska fungera ska göras i
 * BinarySearchTreeNode.
 * 
 * @author henrikbe
 * 
 */
public class BinarySearchTree<T extends Comparable<T>> {

	private BinarySearchTreeNode<T> root;

	public boolean add(T data) {
		if (root == null) {
			root = new BinarySearchTreeNode<T>(data);
			return true;
		} else {
			return root.add(data);
		}
	}

	public boolean remove(T data) {
		int originalSize=size();
		if (root != null)
			root = root.remove(data);
		return size()<originalSize;
	}

	public boolean contains(T data) {
		return root == null ? false : root.contains(data);
	}

	public void clear() {
		root = null;
	}

	public int size() {
		if (root == null)
			return 0;
		else
			return root.size();
	}

	public int depth() {
		if (root == null)
			return -1;
		else
			return root.depth();
	}

	public String toString() {
		return "[" + (root == null ? "" : root.toString()) + "]";
	}

	public T getRoot(){

		return root.data;
	}

	public class BinarySearchTreeNode<T extends Comparable<T>> {

		private T data;
		private BinarySearchTreeNode<T> left;
		private BinarySearchTreeNode<T> right;

		public BinarySearchTreeNode(T data) {
			this(data, null, null);
		}

		private BinarySearchTreeNode(T data, BinarySearchTreeNode<T> lt, BinarySearchTreeNode<T> rt){
			this.data = data;
			this.left = lt;
			this.right = rt;
		}

		public boolean add(T data) {


			BinarySearchTreeNode<T> t = this;
			if(contains(data))
				return false;

			else{
				add(data, t);
				return true;
			}
		}

		private BinarySearchTreeNode<T> add(T data, BinarySearchTreeNode<T> t){

			if(t == null)
				return new BinarySearchTreeNode<T>(data);

			int compareResult = data.compareTo(t.data);

			if(compareResult < 0)
				t.left = add(data, t.left);
			else if(compareResult > 0)
				t.right = add(data, t.right);
			else
				;

			return t;

		}


		public BinarySearchTreeNode<T> findMax(BinarySearchTreeNode<T> t){

			if(t == null)
				return null;

			else if(t.right == null)
				return t;

			return findMax(t.right);
		}

		public BinarySearchTreeNode<T> remove(T data) {
			BinarySearchTreeNode<T> t = this;
			if(contains(data))
				return remove(data, this);

			else
				return t;
		}		



	    private BinarySearchTreeNode<T> remove( T x, BinarySearchTreeNode<T> t )
	    {
	        if( t == null )
	            return t;   // Item not found; do nothing
	            
	        int compareResult = x.compareTo( t.data );
	            
	        if( compareResult < 0 )
	            t.left = remove( x, t.left );
	        else if( compareResult > 0 )
	            t.right = remove( x, t.right );
	        else if( t.left != null && t.right != null ) // Two children
	        {
	            t.data = findMin( t.right ).data;
	            t.right = remove( t.data, t.right );
	        }
	        else
	            t = ( t.left != null ) ? t.left : t.right;
	        return t;
	    }

		private BinarySearchTreeNode<T> findMin(BinarySearchTreeNode<T> t){

			if(t == null)
				return null;

			else if(t.left == null){
				
				return t;
			}
			return findMin(t.left);

		}

		public boolean contains(T data) {

			BinarySearchTreeNode<T> t = this;
			return contains(data, t);

		}

		private boolean contains(T data, BinarySearchTreeNode<T> t){

			if(t == null)
				return false;

			int compareResult = data.compareTo(t.data);

			if(compareResult < 0)
				return contains(data, t.left);
			else if(compareResult > 0)
				return contains(data, t.right);
			else
				return true; //Match

		}

		public int size() {
			BinarySearchTreeNode<T> t = this;
			return size(t);
		}

		private int size(BinarySearchTreeNode<T> t){
			if(t == null)
				return 0;
			else
				return size(t.left) + 1 + size(t.right);
		}

		public int depth() {
			BinarySearchTreeNode<T> t = this;
			return depth(t);
		}

		private int depth(BinarySearchTreeNode<T> t){

			/**
			 * Vi kollar vilket djup som är störst,
			 * vänstra eller högra. Väljder den djupaste
			 * och därefter plussar på 1, eftersom rooten är på -1.
			 */

			if(t == null)
				return -1;

			int lefth = depth(t.left);
			int righth = depth(t.right);

			if(lefth > righth)
				return lefth + 1;
			else
				return righth +1;

		}

		private String toString(BinarySearchTreeNode<T> t, BinarySearchTreeNode<T> max){

			if(t == null)
				return "";

			else if(t.equals(max))
				return ""+t.data;

			else if(t.left == null && t.right == null){
				return "" + t.data + ", ";

			} else {
				String result = "";
				result += toString(t.left, max);
				result += "" + t.data + ", ";
				result += toString(t.right, max);
				return result;
			}

		}

		public String toString() {
			BinarySearchTreeNode<T> t = this;
			BinarySearchTreeNode<T> max = findMax(t); 
			return toString(t, max);
		}
	}
}
