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
}/**
 * https://leetcode.com/problems/gray-code/
 * 
 * 
 */ 
// Date: Thu Jul  1 10:25:15 PDT 2021
class Solution {
    func grayCode(_ n: Int) -> [Int] {
        if n == 1 {
            return [0, 1]
        }
        let prevList = grayCode(n - 1)
        return prevList + (prevList.map { $0 + (1 << (n - 1)) }.reversed())
    }
}