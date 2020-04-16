/**
 * https://leetcode.com/problems/intersection-of-two-arrays-ii/
 * 
 * 
 */ 
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var ret: [Int] = []
        var dict: [Int : Int] = [:]
        
        for n in nums1 {
            dict[n] = dict[n, default: 0] + 1
        }
        
        for n in nums2 {
            if let count = dict[n] {
                if count > 0 {
                    ret.append(n)
                    dict[n] = count - 1
                }
            }
        }
        return ret
    }
}
///
/// Follow up:
/// - What if the given array is already sorted? How would you optimize your algorithm?
///     We could use two-pointer algorithm to go through both arrays. It will take O(max(m, n), where m and n are the lenght of these two arrays.
/// - What if nums1's size is small compared to nums2's size? Which algorithm is better?
///     For two sorted array, we could use binary search in the bigger array to find each element in the smaller array. It will cost O(mlogn), where n is far larger than m.
/// - What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
///     1. If one of these arrays are not that big, could fit in the memory, then we retrieve certain elements of the other array from disk, and compare.
///     2. If both of these two are really large, we could have them sorted, like merge-sort. Then, use two-pointers algorithm, get elements of two arrays from disk, then compare. Keep doing this.
///

