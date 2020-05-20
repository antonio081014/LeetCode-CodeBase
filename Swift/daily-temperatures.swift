/**
 * https://leetcode.com/problems/daily-temperatures/
 * 
 * 
 */ 
// Date: Tue May 19 22:44:24 PDT 2020
/// This problem is pretty much like [Online Stock Span](https://leetcode.com/problems/online-stock-span/)
/// Using stack with O(n).
/// Each index gets pushed and popped at most once from the stack.
class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var temp: [(Int, Int)] = []
        var ret: [Int] = []
        var index = T.count - 1
        while index >= 0 {
            var count = 0
            while let first = temp.first, T[index] >= first.0 {
                temp.removeFirst()
            }
            if let first = temp.first {
                ret = [first.1 - index] + ret
            } else {
                ret = [0] + ret
            }
            
            temp.insert((T[index], index), at: 0)
            index -= 1
        }
        return ret
    }
}
