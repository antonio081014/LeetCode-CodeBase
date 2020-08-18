/**
 * https://leetcode.com/problems/distribute-candies-to-people/
 * 
 * 
 */ 
// Date: Tue Aug 18 08:53:34 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(sqrt(candies))
    ///     - Space: O(1)
    ///
    func distributeCandies(_ candies: Int, _ n: Int) -> [Int] {
        var c = candies
        var result = Array(repeating: 0, count: n)
        var index = 0
        var candy = 1
        while c > 0 {
            result[index] += min(c, candy)
            index = (index + 1) % n
            c -= candy
            candy += 1
        }
        return result
    }
}
