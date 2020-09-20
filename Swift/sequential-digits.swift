/**
 * https://leetcode.com/problems/sequential-digits/
 * 
 * 
 */ 
// Date: Sun Sep 20 11:25:36 PDT 2020
class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var queue: [Int] = Array(1 ... 9)
        var result = [Int]()
        while queue.isEmpty == false {
            let num = queue.removeFirst()
            if num >= low, num <= high {
                result.append(num)
            }
            // This operation certainly terminate the program earlier.
            // But might not be necessary, since the last digit could easily go to 9.
            if num > high { break }
            let lastDigit = num % 10
            if lastDigit < 9 {
                queue.append(num * 10 + lastDigit + 1)
            }
        }
        return result
    }
}