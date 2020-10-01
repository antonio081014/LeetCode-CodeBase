/**
 * https://leetcode.com/problems/number-of-recent-calls/
 * 
 * 
 */ 
// Date: Thu Oct  1 10:08:10 PDT 2020
// Implementation with Sliding Window.
class RecentCounter {
    var calls: [Int]
    
    init() {
        self.calls = []
    }
    
    /// - Complexity:
    ///     - Time: O(3000)
    ///     - Space: O(3000)
    func ping(_ t: Int) -> Int {
        while let first = self.calls.first {
            if t - first <= 3000 {
                break
            }
            self.calls.removeFirst()
        }
        self.calls.append(t)
        return self.calls.count
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */