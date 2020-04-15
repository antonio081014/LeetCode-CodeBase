/**
 * https://leetcode.com/problems/lru-cache/
 * 
 * 
 */ 
class DLNode {
    var key: Int
    var val: Int
    var parent: DLNode?
    var next: DLNode?
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
        self.parent = nil
        self.next = nil
    }
}

class DoubleLinkedList {
    var head: DLNode
    var tail: DLNode
    
    var isEmpty: Bool {
        return self.head.next === self.tail && self.tail.parent === self.head
    }
    
    init() {
        self.head = DLNode(0, 0)
        self.tail = DLNode(0, 0)
        self.head.next = self.tail
        self.tail.parent = self.head
    }
    
    func addToFront(_ node: DLNode) {
        node.parent = self.head
        node.next = self.head.next
        self.head.next?.parent = node
        self.head.next = node
    }
    
    func addToTail(_ node: DLNode) {
        node.next = self.tail
        node.parent = self.tail.parent
        self.tail.parent?.next = node
        self.tail.parent = node
    }
    
    func remove(_ node: DLNode) {
        node.parent?.next = node.next
        node.next?.parent = node.parent
    }
    
    func removeLast() -> DLNode {
        let node = self.tail.parent!
        self.remove(node)
        return node
    }
}

class LRUCache {
    
    var key2Node: [Int : DLNode]
    var root: DoubleLinkedList
    let cap: Int
    var count: Int
    
    init(_ capacity: Int) {
        self.cap = capacity
        self.count = 0
        self.root = DoubleLinkedList()
        self.key2Node = [:]
    }
    
    func get(_ key: Int) -> Int {
        if let node = self.key2Node[key] {
            self.root.remove(node)
            self.root.addToFront(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = self.key2Node[key] {
            self.root.remove(node)
            node.val = value
            self.root.addToFront(node)
        } else {
            if self.count >= self.cap {
                let node = self.root.removeLast()
                self.key2Node[node.key] = nil
                self.count -= 1
            }
            let node = DLNode(key, value)
            self.root.addToFront(node)
            self.key2Node[key] = node
            self.count += 1
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
