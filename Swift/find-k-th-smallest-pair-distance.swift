/**
 * https://leetcode.com/problems/find-k-th-smallest-pair-distance/
 * 
 * 
 */ 
// Date: Fri May  1 10:21:02 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(nlogn + n + w + nlogw)
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        // O(nlogn)
        let nums = nums.sorted()
        
        let n = nums.count
        var occurrence = Array(repeating: 0, count: n)
        // O(n)
        for index in 1 ..< n {
            if nums[index] == nums[index - 1] {
                occurrence[index] = 1 + occurrence[index - 1]
            }
        }
        
        var numberOfPointsBeforeX: [Int] = Array(repeating: 0, count: nums.last! * 2)
        var countIndex = 0
        // O(w)
        for point in 0 ..< numberOfPointsBeforeX.count {
            while countIndex < nums.count, point == nums[countIndex] { countIndex += 1 }
            numberOfPointsBeforeX[point] = countIndex
        }
        
        var left = 0
        var right = nums.last! - nums.first! + 1
        
        // O(nlogw)
        while left < right {
            // Here mid is the distance.
            let mid = left + (right - left) / 2
            // Calculate the number of pairs starting from each nums[index], end with nums[index] + mid
            var count = 0
            for index in 0 ..< n {
                // Here is why we need an array with size nums.last! * 2.
                count += numberOfPointsBeforeX[nums[index] + mid] - numberOfPointsBeforeX[nums[index]] + occurrence[index]
            }
            
            if count >= k {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left == (nums.last! - nums.first! + 1) ? -1 : left
    }
}

