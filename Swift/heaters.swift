/**
 * https://leetcode.com/problems/heaters/
 * 
 * 
 */ 
class Solution {
    // Since the size of array is not big, but O(n^2) is not acceptable, we could use a binary search to help.
    func findRadius(_ houses: [Int], _ hts: [Int]) -> Int {
        var minr = Int.min
        var heaters = hts.sorted()
        for hs in houses {
            var left = 0
            var right = heaters.count - 1
            while left < right {
                let mid = (left + right + 1) / 2
                if heaters[mid] > hs {
                    right = mid - 1
                } else {
                    left = mid
                }
            }
            var r = abs(heaters[left] - hs)
            if left + 1 < heaters.count {
                r = min(r, abs(heaters[left + 1] - hs))
            }
            
            minr = max(minr, r)
        }
        return minr
    }
}

print("\(findRadius([1,2,3,4], [1,4]))")
