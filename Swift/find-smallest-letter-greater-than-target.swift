/**
 * https://leetcode.com/problems/find-smallest-letter-greater-than-target/
 * 
 * 
 */ 
class Solution {
    ///
    /// The key part of this binary search is:
    /// 1. left will be the first possible valid choice.
    /// 2. right - left >= 1, then stop when left == right
    /// 3. In the case left move to all the way to the end, but right never changed, we didn't find the valid choice.
    ///
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var left = 0
        var right = letters.count
        while left < right {
            let mid = left + (right - left) / 2
            if letters[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        // print("Index: \(left)")
        return letters[left % letters.count]
    }
}
