/**
 * https://leetcode.com/problems/next-permutation/
 * 
 * 
 */ 
/**
 Approach 2: Single Pass Approach

 Algorithm

 First, we observe that for any given sequence that is in descending order, no next larger permutation is possible. For example, no next permutation is possible for the following array:

 [9, 5, 4, 3, 1]
 
 We need to find the first pair of two successive numbers a[i] and a[i−1], from the right, which satisfy
 a[i]>a[i−1]. Now, no rearrangements to the right of a[i−1] can create a larger permutation since that subarray consists of numbers in descending order. Thus, we need to rearrange the numbers to the right of a[i−1] including itself.

 Now, what kind of rearrangement will produce the next larger number? We want to create the permutation just larger than the current one. Therefore, we need to replace the number a[i−1] with the number which is just larger than itself among the numbers lying to its right section, say a[j].

Next Permutation

 We swap the numbers
 a[i−1] and a[j]. We now have the correct number at index i−1. But still the current permutation isn't the permutation that we are looking for. We need the smallest permutation that can be formed by using the numbers only to the right of a[i−1]. Therefore, we need to place those numbers in ascending order to get their smallest permutation.

 But, recall that while scanning the numbers from the right, we simply kept decrementing the index until we found the pair a[i] and a[i−1] where, a[i]>a[i−1]. Thus, all numbers to the right of a[i−1] were already sorted in descending order. Furthermore, swapping a[i−1] and a[j] didn't change that order. Therefore, we simply need to reverse the numbers following a[i−1] to get the next smallest lexicographic permutation.
*/

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2
        while i >= 0 {
            if nums[i] < nums[i + 1] { break }
            i -= 1
        }
        if i < 0 {
            // Last permutation.
            nums.sort()
            return
        }
        
        var j = nums.count - 1
        while j > i {
            if nums[j] > nums[i] { break }
            j -= 1
        }
        nums.swapAt(i, j)
        i += 1
        j = nums.count - 1
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}
