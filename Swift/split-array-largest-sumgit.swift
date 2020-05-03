/**
 * https://leetcode.com/problems/split-array-largest-sumgit/
 * 
 * 
 */ 
// Date: Sun May  3 08:01:48 PDT 2020
//class Solution {
//    func splitArray(_ nums: [Int], _ m: Int) -> Int {
//        var sum = [0]
//        for n in nums {
//            sum.append((sum.last ?? 0) + n)
//        }
//        return self.splitArray(sum, m, 1, sum.count - 1)
//    }
//
//    private func splitArray(_ sum: [Int], _ m: Int, _ left: Int, _ right: Int) -> Int {
//        if m == 1 {
//            return sum[right] - sum[left - 1]
//        }
//
//        let half = m / 2
//        var lo = left
//        var hi = right
//
//        while lo < hi {
//            let mid = lo + (hi - lo) / 2
//            if sum[mid] - sum[left - 1] >= sum[right] - sum[mid] {
//                hi = mid
//            } else {
//                lo = mid + 1
//            }
//        }
//        print("\(left) - \(right) : \(lo - 1)")
//        if lo == left {
//            lo += 1
//        }
//        return max(splitArray(sum, half, left, lo - 1), splitArray(sum, m - half, lo, right))
//    }
//}

class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        var left = 0
        var right = 0
        for n in nums {
            left = max(left, n)
            right += n
        }
        right += 1
        while left < right {
            let mid = left + (right - left) / 2
            if isValid(nums, m, mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        if isValid(nums, m, left) { return left }
        return -1
    }
    
    private func isValid(_ nums: [Int], _ m: Int, _ targetSum: Int) -> Bool {
        var count = 0
        var sum = 0
        for n in nums {
            if sum + n > targetSum {
                count += 1
                sum = 0
                if count > m { return false }
            }
            sum += n
        }
        count += sum > 0 ? 1 : 0
        return count <= m
    }
}
