/**
 * Problem Link: https://leetcode.com/problems/median-of-two-sorted-arrays/
 *
 * findKthSmallest between two sorted arrays.
 *
 * For this problem, we are trying to find the median of the 
 */

class Solution {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let sum = nums1.count + nums2.count
        if sum % 2 != 0 {
            return Double(findKthSmallest(sum / 2, between: nums1, and: nums2))
        } else {
            return Double(findKthSmallest(sum / 2, between: nums1, and: nums2) + findKthSmallest(sum / 2 - 1, between: nums1, and: nums2)) / 2.0
        }
    }
    
    private func findKthSmallest(_ k: Int, between nums1: [Int], and nums2: [Int]) -> Int {
        if nums1.count == 0 {
            return nums2[k]
        }
        if nums2.count == 0 {
            return nums1[k]
        }
        if k == 0 {
            return min(nums1.first!, nums2.first!)
        }
        
        let mid1 = nums1.count * k / (nums1.count + nums2.count)
        let mid2 = k - mid1 - 1
        
        if nums1[mid1] > nums2[mid2] {
            return findKthSmallest(k - mid2 - 1, between: Array(nums1.dropLast(nums1.count - mid1 - 1)), and: Array(nums2.dropFirst(mid2 + 1)))
        } else {
            return findKthSmallest(k - mid1 - 1, between: Array(nums1.dropFirst(mid1 + 1)), and: Array(nums2.dropLast(nums2.count - mid2 - 1)))
        }
    }
}
/**
 * https://leetcode.com/problems/median-of-two-sorted-arrays/
 * 
 * 
 */ 
// Date: Sat Apr 25 12:06:55 PDT 2020
/// Found this great video and it explained everything
/// https://www.youtube.com/watch?v=KB9IcSCDQ9k
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let len1 = nums1.count
        let len2 = nums2.count
        if len1 > len2 {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let halfLen = (len1 + len2 + 1) / 2 // take the upper bound
        
        var minLen = 0
        var maxLen = len1
        while minLen <= maxLen {
            let leftLen1 = minLen + (maxLen - minLen) / 2
            let leftLen2 = halfLen - leftLen1
            if leftLen1 < maxLen, nums1[leftLen1] < nums2[leftLen2 - 1] {
                minLen = leftLen1 + 1
            } else if leftLen1 > 0, nums1[leftLen1 - 1] > nums2[leftLen2] {
                maxLen = leftLen1 - 1
            } else {
                // Found the right length in nums1 for left part.
                var maxLeft = 0
                if leftLen1 == 0 {
                    maxLeft = nums2[leftLen2 - 1]
                } else if leftLen2 == 0 {
                    maxLeft = nums1[leftLen1 - 1]
                } else {
                    maxLeft = max(nums2[leftLen2 - 1], nums1[leftLen1 - 1])
                }
                if (len1 + len2) % 2 == 1 { return Double(maxLeft) }
                
                var minRight = 0
                if leftLen1 == len1 {
                    minRight = nums2[leftLen2]
                } else if leftLen2 == len2 {
                    minRight = nums1[leftLen1]
                } else {
                    minRight = min(nums1[leftLen1], nums2[leftLen2])
                }
                return Double(maxLeft + minRight) / 2.0
            }
        }
        return 0
    }
}
