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
}