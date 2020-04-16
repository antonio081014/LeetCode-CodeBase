/**
 * https://leetcode.com/problems/find-smallest-letter-greater-than-target/
 * 
 * 
 */ 
class Solution {
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
