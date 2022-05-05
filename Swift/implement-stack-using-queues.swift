/**
 * https://leetcode.com/problems/implement-stack-using-queues/
 * 
 * 
 */ 
// Date: Wed May  4 22:40:38 PDT 2022

class MyStack {

    private var q1: [Int]
    private var q2: [Int]
    private var last: Int
    init() {
        q1 = []
        q2 = []
        last = 0
    }
    
    func push(_ x: Int) {
        q1.append(x)
        last = x
    }
    
    func pop() -> Int {
        var sz = q1.count
        while sz > 1 {
            sz -= 1
            last = q1.removeFirst()
            q2.append(last)
        }
        let ret = q1.removeLast()
        q1 = q2
        q2 = []
        return ret
    }
    
    func top() -> Int {
        return last
    }
    
    func empty() -> Bool {
        return q1.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */