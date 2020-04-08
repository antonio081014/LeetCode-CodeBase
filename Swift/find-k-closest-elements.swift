/**
 * https://leetcode.com/problems/find-k-closest-elements/
 * 
 * 
 */ 
class Solution {
    ///
    /// In this problem, we are trying to find the a window with minimum diff between x and those boundaries,
    /// since the array are dealing with  is a sorted array.
    ///
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - k
        while left < right {
            let mid = left + (right - left) / 2
            if x - arr[mid] > arr[mid + k] - x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return Array(arr[(left)..<(left + k)])
    }
}
