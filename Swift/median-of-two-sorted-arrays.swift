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
