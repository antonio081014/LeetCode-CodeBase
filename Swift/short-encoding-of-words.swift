/**
 * https://leetcode.com/problems/short-encoding-of-words/
 * 
 * 
 */ 
// Date: Mon Mar  8 17:30:53 PST 2021
class Solution {
    func minimumLengthEncoding(_ words: [String]) -> Int {
        var count = 0
        let array:[String] = words.map({String($0.reversed())}).sorted()
        for i in 0..<array.count-1{
            count += array[i+1].hasPrefix(array[i]) == false ? (array[i].count + 1) : 0
        }
        return count + array.last!.count + 1
    }
}