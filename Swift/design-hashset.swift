class MyHashSet {

    private var visited: [Bool]
    private var length: Int
    
    init() {
        self.visited = []
        self.length = 0
    }
    
    // - Complexity:
    //      - Time: O(n), 
    func add(_ key: Int) {
        if key >= self.length {
            self.visited += Array(repeating: false, count: key - visited.count + 1)
            self.length = key + 1
        }
        visited[key] = true
    }
    
    func remove(_ key: Int) {
        if key < self.length {
            visited[key] = false
        }
        
    }
    
    func contains(_ key: Int) -> Bool {
        if key < self.length {
            return visited[key]
        }
        return false
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
