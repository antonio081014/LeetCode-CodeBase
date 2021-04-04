/**
 * https://leetcode.com/problems/design-circular-queue/
 * 
 * 
 */ 
// Date: Sun Apr  4 09:30:31 PDT 2021
class MyCircularQueue {
    var array: [Int]
    let capacity: Int
    init(_ k: Int) {
        self.capacity = k
        array = []
    }
    
    func enQueue(_ value: Int) -> Bool {
        if self.array.count < self.capacity {
            self.array.append(value)
            return true
        }
        return false
    }
    
    func deQueue() -> Bool {
        if self.array.isEmpty == false {
            self.array.removeFirst()
            return true
        }
        return false
    }
    
    func Front() -> Int {
        if let first = self.array.first {
            return first
        }
        return -1
    }
    
    func Rear() -> Int {
        if let last = self.array.last {
            return last
        }
        return -1
    }
    
    func isEmpty() -> Bool {
        return self.array.isEmpty
    }
    
    func isFull() -> Bool {
        return self.array.count == self.capacity
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */