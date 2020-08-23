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
}