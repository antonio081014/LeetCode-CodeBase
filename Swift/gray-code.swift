/**
 * https://leetcode.com/problems/gray-code/
 * 
 * 
 */ 
// Date: Thu Jul  1 10:20:34 PDT 2021
class Solution {
    func grayCode(_ n: Int) -> [Int] {
        var result = [0, 1]
        for offset in stride(from: 1, to: n, by: 1) {
            let addon = 1 << offset
            var list = [Int]()
            for index in stride(from: result.count - 1, through: 0, by: -1) {
                list.append(result[index] + addon)
            }
            result += list
        }
        return result
    }
}