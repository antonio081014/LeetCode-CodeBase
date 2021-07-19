/**
 * https://leetcode.com/problems/three-equal-parts/
 * 
 * 
 */ 
// Date: Sat Jul 17 23:20:29 PDT 2021
class Solution {
    func threeEqualParts(_ arr: [Int]) -> [Int] {
        let impossible = [-1, -1]
        var targetOnes = 0
        for n in arr {
            targetOnes += n
        }
        if targetOnes % 3 != 0 { return impossible }
        targetOnes /= 3
        if targetOnes == 0 {
            return [0, arr.count - 1]
        }
        
        var i1 = -1
        var j1 = -1
        var i2 = -1
        var j2 = -1
        var i3 = -1
        var j3 = -1
        
        var count = 0
        for index in 0 ..< arr.count {
            if arr[index] == 1 {
                count += 1
                if count == 1 { i1 = index }
                if count == targetOnes { j1 = index }
                if count == (targetOnes + 1) { i2 = index }
                if count == targetOnes * 2 { j2 = index }
                if count == (targetOnes * 2 + 1) { i3 = index }
                if count == targetOnes * 3 { j3 = index }
            }
        }
        // The array is in the form W [i1, j1] X [i2, j2] Y [i3, j3] Z
        let list1 = Array(arr[i1 ... j1])
        let list2 = Array(arr[i2 ... j2])
        let list3 = Array(arr[i3 ... j3])
        if list1 != list2 || list2 != list3 { return impossible }
        let x = i2 - j1 - 1
        let y = i3 - j2 - 1
        let z = arr.count - j3 - 1
        if z > min(x, y) { return impossible }
        return [j1 + z, j2 + z + 1]
    }
}