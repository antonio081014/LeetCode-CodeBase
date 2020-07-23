/**
 * https://leetcode.com/problems/spiral-matrix/
 * 
 * 
 */ 
// Date: Thu Jul 23 16:07:29 PDT 2020
class Solution {
    /// - Complexity:
    ///     - Time: O(m*n), m and n are sizes of width and height of matrix.
    ///     - Space: O(m*n), to store all the elements for return.
    ///
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let n = matrix.count
        guard let m = matrix.first?.count else { return [] }
        
        ///1. Append top bound.
        ///2. Append trailing bound without top, bottom elements.
        ///3, Append bottom bound.
        ///4. Append leading bound without top, bottom elements.
        func trace(_ x: Int, _ y: Int, _ w: Int, _ h: Int) -> [Int] {
            var list: [Int] = []
            if h == 0 || w == 0 { return list }
            
            for index in y ..< (y + w) {
                list.append(matrix[x][index])
            }
            // print(list)
            if h > 2 {
                for index in (x + 1) ..< (x + h - 1) {
                    list.append(matrix[index][y + w - 1])
                }
            }
            // print(list)
            if h > 1 {
                for index in stride(from: y + w - 1, through: y, by: -1) {
                    list.append(matrix[x + h - 1][index])
                }
            }
            // print(list)
            if h > 2, w > 1 {
                for index in stride(from: x + h - 2, through: x + 1, by: -1) {
                    list.append(matrix[index][y])
                }
            }
            // print(list)
            return list
        }
        
        var result: [Int] = []
        var offset = 0
        while offset <= n / 2 && offset <= m / 2 {
            let x = offset
            let y = offset
            let w = m - 2 * (y)
            let h = n - 2 * (x)
            let path = trace(x, y, w, h)
            // print("\(w) : \(h) - \(path)")
            result += path
            offset += 1
        }
        return result
    }
    
}
