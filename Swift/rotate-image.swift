/**
 * https://leetcode.com/problems/rotate-image/
 * 
 * 
 */ 
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for offset in  0 ..< matrix.count / 2 {
            rotate(&matrix, offset)
        }
    }
    
    func rotate(_ matrix: inout [[Int]], _ offset: Int) {
        let size = matrix.count - offset * 2
        for index in 0 ..< (size - 1) {
            let tmp = matrix[offset][index + offset]
            matrix[offset][index + offset] = matrix[offset + size - index - 1][offset]
            matrix[offset + size - index - 1][offset] = matrix[offset + size - 1][offset + size - index - 1]
            matrix[offset + size - 1][offset + size - index - 1] = matrix[offset + index][offset + size - 1]
            matrix[offset + index][offset + size - 1] = tmp
        }
    }
}
