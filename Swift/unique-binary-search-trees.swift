/**
 * https://leetcode.com/problems/unique-binary-search-trees/
 * 
 * 
 */ 
// Date: Wed Jun 24 09:24:48 PDT 2020
class Solution {

    func numTrees(_ n: Int) -> Int {
        var map: [Int : Int] = [:]
        map[0] = 1
        map[1] = 1
        map[2] = 2
        /// In this function, we are trying to choose the position of the root from number 1 ... key.
        /// We let the left + 1 as the root, then, there will be left number elements in left tree.
        /// key - left - 1 on the right subtree.
        /// We also use memorization tech to store all the calculated answers.
        func cal(_ key : Int) -> Int {
            if let val = map[key] { return val }
            var count = 0
            for left in 0 ..< key {
                count += cal(left) * cal(key - left - 1)
            }
            map[key] = count
            return count
        }
        return cal(n)
    }
}
