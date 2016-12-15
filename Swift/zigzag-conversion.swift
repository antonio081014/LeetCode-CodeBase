/**
 * Problem Link: https://leetcode.com/problems/zigzag-conversion/
 *
 *
 */

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        var ret = [String]()
        let str = s.characters.map({"\($0)"})
        let pat = pattern(numRows)
        
        for r in 0..<numRows {
            var tmp = ""
            if pat[r].count > 1 {
                var index1 = pat[r][0]
                var index2 = pat[r][1]
                while index1 < str.count || index2 < str.count {
                    if index1 < str.count {
                        tmp += str[index1]
                        index1 += 2 * numRows - 2
                    }
                    if index2 < str.count {
                        tmp += str[index2]
                        index2 += 2 * numRows - 2
                    }
                }
            } else {
                var index1 = pat[r][0]
                while index1 < str.count {
                    tmp += str[index1]
                    index1 += 2 * numRows - 2
                }
            }
            ret += [tmp]
        }
        return ret.joined()
    }
    
    private func pattern(_ rows: Int) -> [[Int]] {
        var ret = [[Int]]()
        for i in 0..<rows {
            var list = [i]
            if i != 0 && i != rows-1 {
                list += [2 * rows - 2 - i]
            }
            ret += [list]
        }
        return ret
    }
}
