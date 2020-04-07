/**
 * https://leetcode.com/problems/min-stack/
 * 
 * 
 */

/// This solution uses binary search to locate the index of target element.
/// Thus, it takes O(logN), N is number of elements in the array, to push and pop.
///
///
class MinStack {
    
    var backupArray: [Int]
    var sortedArray: [Int]
    
    /** initialize your data structure here. */
    init() {
        self.backupArray = []
        self.sortedArray = []
    }
    
    /// Use Array.append, will cost O(1) time here
    /// While using Array.insert(_, at:) will cost O(n), n is the number of elements in the array.
    func push(_ x: Int) {
        self.backupArray.append(x)
        self.binaryInsert(x)
    }
    
    /// Use Array.append, will cost O(1) time here
    /// While using Array.insert(_, at:) will cost O(n), n is the number of elements in the array.
    func pop() {
        if let x = self.backupArray.last {
            self.backupArray.removeLast()
            self.binaryRemove(x)
        }
    }
    
    func top() -> Int {
        if let x = self.backupArray.last {
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

///
/// This solution uses a simple Array to maintain as a stack.
/// Meanwhile, it also push the current minimum value back to the array.
///
/// - Complexity: 0(1), every move takes constant time.
///
class MinStack {
    
    var stack: [Int]
    
    /** initialize your data structure here. */
    init() {
        self.stack = []
    }
    
    func push(_ x: Int) {
        let minElement = min(x, self.stack.last ?? Int.max)
        self.stack.append(x)
        self.stack.append(minElement)
    }
    
    func pop() {
        self.stack.removeLast()
        self.stack.removeLast()
    }
    
    func top() -> Int {
        guard self.stack.isEmpty == false else { return Int.max }
        return self.stack[self.stack.count - 2]
    }
    
    func getMin() -> Int {
        return self.stack.last ?? Int.max
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
