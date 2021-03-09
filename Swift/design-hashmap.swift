/**
 * https://leetcode.com/problems/design-hashmap/
 * 
 * 
 */ 
// Date: Mon Mar  8 17:12:42 PST 2021
class MyHashMap {

    var backupArray: [Int]
    /** Initialize your data structure here. */
    init() {
        self.backupArray = []
    }

    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        if key >= self.backupArray.count {
            self.backupArray += Array(repeating: -1, count: key - self.backupArray.count + 1)
        }
        self.backupArray[key] = value
    }

    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        guard key < self.backupArray.count else { return -1 }
        return self.backupArray[key]
    }

    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        guard key < self.backupArray.count else { return }
        self.backupArray[key] = -1
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */

