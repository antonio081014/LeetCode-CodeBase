/**
 * https://leetcode.com/problems/sort-array-by-parity/
 * 
 * 
 */ 
// Date: Fri Aug 21 10:09:39 PDT 2020
/// - Complexity:
///     - Time: O(n), n is the number of elements in the array.
///     - Space: O(n), axillary array is created for return values.
///
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var evenCount = 0
        for a in A {
            if a % 2 == 0 {
                evenCount += 1
            }
        }
        var result = Array(repeating: 0, count: A.count)
        var evenIndex = 0
        var oddIndex = evenCount
        for a in A {
            if a % 2 == 0 {
                result[evenIndex] = a
                evenIndex += 1
            } else {
                result[oddIndex] = a
                oddIndex += 1
            }
        }
        return result
    }
}/**
 * https://leetcode.com/problems/sort-array-by-parity/
 * 
 * 
 */ 
// Date: Fri Aug 21 10:30:54 PDT 2020

/// Using two pointers
/// The problem asks to have all the even number before odd numbers, 
/// but it doesn't say to keep in place order.
///
/// - Complexity:
///     - Time: O(n), n is number of elements in A.
///     - Space: O(n), to make original array mutating. For the rest of memory are constants.
///
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var A = A
        var start = 0
        var end = A.count - 1
        while start < end {
            if A[start] % 2 > A[end] % 2 {
                A.swapAt(start, end)
            }
            if A[start] % 2 == 0 { start += 1 }
            if A[end] % 2 == 1 { end -= 1 }
        }
        return A
    }
}