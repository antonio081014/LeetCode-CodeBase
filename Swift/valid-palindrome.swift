/**
 * https://leetcode.com/problems/valid-palindrome/
 * 
 * 
 */ 
import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let listofarray = s.lowercased().characters.map({"\($0)"})
        var left = 0
        var right = listofarray.count-1
        while left < right {
//            print("Outter: \(left) - \(right)")
            if !isalphanumeric(listofarray[left]) {left += 1}
            else if !isalphanumeric(listofarray[right]) {right -= 1}
            else {
//                print("Inner: \(left) - \(right)")
                if listofarray[left] != listofarray[right] {return false}
                else {
                    left += 1
                    right -= 1
                }
            }
        }
        return true
    }
    
    private func isalphanumeric2(_ s: String) -> Bool {
        var characterSet = CharacterSet().union(CharacterSet.alphanumerics)
        characterSet.invert()
        return s.rangeOfCharacter(from: characterSet) == nil
    }
    
    private func isalphanumeric(_ s: String) -> Bool {
        let pattern = "0123456789abcdefghijklmnopqrstuvwxyz"
        return pattern.contains(s)
    }
}

let solution = Solution()
print("\(solution.isPalindrome("race a car"))")
print("\(solution.isPalindrome("A man, a plan, a canal: Panama"))")
/**
 * https://leetcode.com/problems/valid-palindrome/
 * 
 * 
 */ 
// Date: Sun May  3 16:00:23 PDT 2020
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let dict = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        // O(s.count)
        let s = s.uppercased().filter { dict.contains($0) }
        if s.isEmpty { return true }
        var start = s.startIndex
        var end = s.index(before: s.endIndex)
        // print("\(s): \(start) - \(end)")
        
        // O(s.count)
        while start < end {
            if !dict.contains(s[start]) { start = s.index(after: start) }
            if !dict.contains(s[end]) { end = s.index(before: end) }
            else if s[start] != s[end] { return false }
            else {
                start = s.index(after: start)
                end = s.index(before: end)
            }
        }
        return true
    }
}
