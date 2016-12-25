/**
 * https://leetcode.com/problems/minimum-moves-to-equal-array-elements/
 * 
 * 
 */ 
/**
 * Adding 1 to n - 1 elements is the same as subtracting 1 from one element, 
 * w.r.t goal of making the elements in the array equal.
 * So, best way to do this is make all the elements in the array equal to the min element.
 * sum(array) - n * minimum
 */
class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        var minx = Int.max
        var total = 0
        for n in nums {
            minx = min(minx, n)
            total += n
        }
        return total - nums.count * minx
    }
}
