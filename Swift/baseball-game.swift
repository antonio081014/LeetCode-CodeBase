/**
 * https://leetcode.com/problems/baseball-game/
 * 
 * 
 */ 
// Date: Sat Apr  9 23:27:59 PDT 2022
class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var result = [Int]()
        for op in ops {
            if op == "+" {
                let n = result.count
                let sum = result[n - 1] + result[n - 2]
                result.append(sum)
            } else if op == "D" {
                let d = result[result.count - 1] * 2
                result.append(d)
            } else if op == "C" {
                result.removeLast()
            } else {
                result.append(Int(op)!)
            }
            // print(result)
        }
        return result.reduce(0) { $0 + $1 }
    }
}