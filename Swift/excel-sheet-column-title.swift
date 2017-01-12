/**
 * https://leetcode.com/problems/excel-sheet-column-title/
 * 
 * 
 */ 
class Solution {
    func convertToTitle(_ n: Int) -> String {
        var num = n
        var colString = ""
        while num > 0 {
            let x = (num-1) % 26
            num = (num-1)/26
            colString = String(stringInterpolationSegment: UnicodeScalar(x + 65)!) + colString
        }
        return colString
    }
}
