/**
 * https://leetcode.com/problems/binary-trees-with-factors/
 * 
 * 
 */ 
// Date: Thu Mar 18 21:09:13 PDT 2021
class Solution {
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        let arr = arr.sorted()
        let mod = 1_000_000_007
        var map: [Int : Int] = [:]
        for x in arr {
            map[x] = 1
        }
        var result = 0
        for i in stride(from: 0, to: arr.count, by: 1) {
            for j in stride(from: 0, to: i, by: 1) {
                if arr[i] % arr[j] == 0, let x = map[arr[j]], let y = map[arr[i] / arr[j]] {
                    map[arr[i]] = (map[arr[i]]! + x * y) % mod
                }
            }
            // print("\(arr[i]) - \(map[arr[i]])")
            result = (result + map[arr[i]]!) % mod
        }
        return result
    }
}