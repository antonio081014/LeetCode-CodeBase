/**
 * https://leetcode.com/problems/sort-array-by-parity-ii/
 * 
 * 
 */ 
// Date: Sun Aug 23 11:29:51 PDT 2020
/// - Complexity: 
///     - Time: O(n), n is the number of elemetns in A.
///     - Space: O(n), n is the number of elemetns in A.
///
class Solution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: A.count)
        var index = 0
        for n in A {
           if n % 2 == 0 {
               result[index] = n
               index += 2
           } 
        }
        index = 1
        for n in A {
            if n % 2 != 0 {
               result[index] = n
               index += 2
           }
        }
        return result
    }
}/**
 * https://leetcode.com/problems/sort-array-by-parity-ii/
 * 
 * 
 */ 
// Date: Fri Aug 28 10:14:09 PDT 2020
/// One pass with two pointers, which keeps the next to be 
/// located index of odd/even number.
/// - Complexity: 
///     - Time: O(n), n is the number of elemetns in A.
///     - Space: O(n), n is the number of elemetns in A.
///
class Solution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: A.count)
        var index1 = 0
        var index2 = 1
        for n in A {
           if n % 2 == 0 {
               result[index1] = n
               index1 += 2
           } else {
               result[index2] = n
               index2 += 2
           }
        }
        return result
    }
}