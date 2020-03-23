/**
 * https://leetcode.com/problems/four-divisors/
 * 
 * 
 */ 
class Solution {
    func sumFourDivisors(_ nums: [Int]) -> Int {
        var sum = 0
        for num in nums {
            if num < 5 { continue }
            var div = 0
            for d in stride(from: 2, through: Int(sqrt(Double(num))), by: 1) {
                // print("Div: \(d)")
                if num % d == 0 {
                    if div != 0 {
                        div = 0
                        break
                    } else {
                        div = d
                    }
                }
            }
            if div != 0, num != (div * div) {
                // print("\(num) - \(div)")
                sum += num + 1 + div + num / div
            }
        }
        return sum
    }
}