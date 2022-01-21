/**
 * https://leetcode.com/problems/koko-eating-bananas/
 * 
 * 
 */ 
// Date: Thu Jan 20 19:45:18 PST 2022
/// - Complexity:
///    - Time: O(nlogm), n = piles.count, m = right, the maximum element in piles.
///    - Space: O(1), no extra space, only constant.
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        // O(n), n = piles.count linear time to figure out the max element.
        var right = piles.max()!
        // O(nlogm), n = piles.count, m = right, the maximum element in piles.
        while left < right {
            let mid = left + (right - left) / 2
            var hours = 0
            // Linear time to find out the total hours will be spent to eat.
            for p in piles {
                hours += (p + mid - 1) / mid
            }
            if hours <= h {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}