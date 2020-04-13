/**
 * https://leetcode.com/problems/insert-delete-getrandom-o1/
 * 
 * 
 */ 
class RandomizedSet {
    
    fileprivate var backingArray: [Int]
    fileprivate var value2index: [Int : Int]
    
    /** Initialize your data structure here. */
    init() {
        self.backingArray = []
        self.value2index = [:]
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if value2index[val] != nil { return false }
        self.backingArray.append(val)
        self.value2index[val] = self.backingArray.count - 1
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if let index = self.value2index[val] {
            if index != self.backingArray.count - 1 {
                let last = self.backingArray[self.backingArray.count - 1]
                self.value2index[last] = index
                self.backingArray[index] = last
            }
            self.value2index[val] = nil
            self.backingArray.removeLast()
            return true
        }
        return false
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        let index = Int.random(in: 0 ..< self.backingArray.count)
        return self.backingArray[index]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
