class Node{
    int key;
    int value;
    Node pre;
    Node next;
 
    public Node(int key, int value){
        this.key = key;
        this.value = value;
    }
}

public class LRUCache {
    private int cap;
    private HashMap<Integer, Node> map;
    private Node head;
    private Node end;
    
    public LRUCache(int capacity) {
        cap = capacity;
        map = new HashMap<Integer, Node>();
        head = null;
        end = null;
    }
    
    public int get(int key) {
        if(map.get(key) != null) {
            Node node = map.get(key);
            remove(node);
            setHead(node);
            return node.value;
        }
        return -1;
    }
    
    public void set(int key, int value) {
        if(map.containsKey(key)){
            Node old = map.get(key);
            old.value = value;
            remove(old);
            setHead(old);
        } else {
            Node node = new Node(key, value);
            if(map.size() >= cap) {
                map.remove(end.key);
                remove(end);
            }
            setHead(node);
            map.put(key, node);
        }
    }
    
    private void remove(Node n) {
        if(n.pre != null) n.pre.next = n.next;
        else head = n.next;
        if(n.next != null) n.next.pre = n.pre;
        else end = n.pre;
    }
    
    private void setHead(Node n){
        n.next = head;
        n.pre = null;
        
        if(head != null) head.pre = n;
        head = n;
        if(end == null) end = head;
    }
}
