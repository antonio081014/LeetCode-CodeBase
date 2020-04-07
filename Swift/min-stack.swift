/**
 * https://leetcode.com/problems/min-stack/
 * 
 * 
 */ 
class MinStack {
    
    var backupArray: [Int]
    var sortedArray: [Int]
    
    /** initialize your data structure here. */
    init() {
        self.backupArray = []
        self.sortedArray = []
    }
    
    func push(_ x: Int) {
        self.backupArray.insert(x, at: 0)
        self.binaryInsert(x)
    }
    
    func pop() {
        if let x = self.backupArray.first {
            self.backupArray.remove(at: 0)
            self.binaryRemove(x)
        }
    }
    
    func top() -> Int {
        if let x = self.backupArray.first {
            return x
        }
        return 0
    }
    
    func getMin() -> Int {
        if let min = self.sortedArray.first {
            return min
        }
        return -1
    }
    
    private func binaryInsert(_ x: Int) {
        if let last = self.sortedArray.last, last <= x {
            self.sortedArray.append(x)
            return
        }
        if let first = self.sortedArray.first, first >= x {
            self.sortedArray.insert(x, at: 0)
            return
        }
        var left = 0
        var right = sortedArray.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if self.sortedArray[mid] < x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        self.sortedArray.insert(x, at: left)
        // print("\(self.sortedArray)")
    }
    
    private func binaryRemove(_ x: Int) {
        var left = 0
        var right = sortedArray.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if self.sortedArray[mid] == x {
                self.sortedArray.remove(at: mid)
                return
            }
            if self.sortedArray[mid] < x {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
