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
