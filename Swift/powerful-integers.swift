/**
 * https://leetcode.com/problems/powerful-integers/
 * 
 * 
 */ 
// Date: Fri Apr 30 11:44:05 PDT 2021
class Solution {
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {

        var result: Set<Int> = []

        var a = 1
        while a <= bound {
            var b = 1
            while b <= bound {
                if a + b <= bound {
                    result.insert(a + b)
                }
                b *= y
                if y == 1 { break }
            }
            a *= x
            if x == 1 { break }
        }
        
        return Array(result)
    }
}
