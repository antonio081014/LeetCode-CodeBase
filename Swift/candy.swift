/**
 * https://leetcode.com/problems/candy/
 * 
 * 
 */ 
// Date: Sun Jun 27 08:21:42 PDT 2021
class Solution {
    /// I try to summarize the post's idea:
    /// Do it in two directions.
    /// The first loop makes sure children with a higher rating get more candy than its left neighbor; 
    /// the second loop makes sure children with a higher rating get more candy than its right neighbor.
    ///
    func candy(_ ratings: [Int]) -> Int {
        let n = ratings.count
        var candies = Array(repeating: 1, count: n)
        for index in stride(from: 1, to: n, by: 1) {
            if ratings[index] > ratings[index - 1] {
                candies[index] = candies[index - 1] + 1
            }
        }
        for index in stride(from: n - 2, through: 0, by: -1) {
            if ratings[index] > ratings[index + 1] {
                candies[index] = max(candies[index], 1 + candies[index + 1])
            }
        }
        // print(candies)
        return candies.reduce(0) { $0 + $1 }
    }
}