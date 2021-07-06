/**
 * https://leetcode.com/problems/reduce-array-size-to-the-half/
 * 
 * 
 */ 
// Date: Tue Jul  6 08:06:50 PDT 2021
class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        var count: [Int : Int] = [:]
        for n in arr {
            count[n, default: 0] += 1
        }
        var n = arr.count
        let values = count.values.sorted { $0 > $1 }
        for index in stride(from: 0, to: values.count, by: 1) {
            n -= values[index]
            if n * 2 <= arr.count { return index + 1 }
        }
        return values.count
    }
}

