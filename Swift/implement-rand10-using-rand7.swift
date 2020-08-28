/**
 * https://leetcode.com/problems/implement-rand10-using-rand7/
 * 
 * 
 */ 
// Date: Fri Aug 28 10:07:10 PDT 2020
/**
 * The rand7() API is already defined in the parent class SolBase.
 * func rand7() -> Int = {}
 * @return a random integer in the range 1 to 7
 */

 /**
    1  2  3  4  5  6  7
 1  1  2  3  4  5  6  7
 2  8  9 10  1  2  3  4
 3  5  6  7  8  9 10  1
 4  2  3  4  5  6  7  8
 5  9 10  1  2  3  4  5
 6  6  7  8  9 10  X  X
 7  X  X  X  X  X  X  X
 */

 /// Call rand7() twice could randomly 
 /// produce 1 to 49 uniformly.
 /// We could fill the table in the above way, each number
 /// still has its uniform character.
 /// 
 /// Use numbers 1 to 40, map them to 1 to 10 by using modular.
 /// Thus, mapping result 1 to 10 stays uniformly contributed.
 ///
 /// - Complexity:
 ///    - Time: O(1), in general case, but it could be infinite in worst case.
 ///    - Space: O(1).
 ///
class Solution : SolBase {
    func rand10() -> Int {
        var row: Int
        var col: Int
        repeat {
            row = rand7()
            col = rand7()
            let ret = (row - 1) * 7 + col
            if ret <= 40 {
                return ret % 10 + 1
            }
        } while true
        return 0
    }
}