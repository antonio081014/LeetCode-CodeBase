/**
 * https://leetcode.com/problems/maximum-area-of-a-piece-of-cake-after-horizontal-and-vertical-cuts/
 * 
 * 
 */ 
// Date: Thu Jun  3 15:45:45 PDT 2021
class Solution {
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        let hc = [0] + horizontalCuts.sorted() + [h]
        let vc = [0] + verticalCuts.sorted() + [w]
        var hDist = [Int]()
        var vDist = [Int]()
        for index in stride(from: 1, to: hc.count, by: 1) {
            hDist.append(hc[index] - hc[index - 1])
        }
        for index in stride(from: 1, to: vc.count, by: 1) {
            vDist.append(vc[index] - vc[index - 1])
        }
        return ((hDist.max()! % 1000000007) * (vDist.max()! % 1000000007)) % 1000000007
    }
}