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
 *//**
 * https://leetcode.com/problems/design-circular-queue/
 * 
 * 
 */ 
// Date: Sun Apr  4 09:59:53 PDT 2021
class MyCircularQueue {
    let capacity: Int
    var array: [Int]
    var top: Int
    var count: Int
    init(_ k: Int) {
        self.capacity = k
        self.array = Array(repeating: 0, count: k)
        self.top = 0
        self.count = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        if self.isFull() { return false }
        self.array[(self.top + self.count) % self.capacity] = value
        self.count += 1
        return true
    }
    
    func deQueue() -> Bool {
        if self.isEmpty() { return false }
        self.top = (self.top + 1) % self.capacity
        self.count -= 1
        return true
    }
    
    func Front() -> Int {
        if self.isEmpty() { return -1 }
        return self.array[self.top]
    }
    
    func Rear() -> Int {
        if self.isEmpty() { return -1 }
        let index = (self.top + self.count - 1 + self.capacity) % self.capacity
        return self.array[index]
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func isFull() -> Bool {
        return self.count == self.capacity
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