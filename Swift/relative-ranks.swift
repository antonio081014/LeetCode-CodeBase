/**
 * https://leetcode.com/problems/relative-ranks/
 * 
 * 
 */ 
class Solution {
    // Fulfill with Collection reduce and map.
    func findRelativeRanks(_ nums: [Int]) -> [String] {
        let n = nums.count
        let indexedList: [(Int, Int)] = (0..<n).reduce([(Int, Int)]()) {
            var list = $0
            list += [($1, nums[$1])]
            return list
            }.sorted(by: {$0.1 > $1.1})
        let textedList: [(Int, String)] = (0..<n).reduce([(Int, String)]()) {
            let index = $1
            switch index {
            case 0: return $0 + [(indexedList[index].0, "Gold Medal")]
            case 1: return $0 + [(indexedList[index].0, "Silver Medal")]
            case 2: return $0 + [(indexedList[index].0, "Bronze Medal")]
            default: return $0 + [(indexedList[index].0, "\(index + 1)")]
            }
            }.sorted(by: { $0.0 < $1.0 })
        return textedList.map() { $0.1 }
    }
    
    // Fulfill with Collection map only.
    func findRelativeRanks(_ nums: [Int]) -> [String] {
        let n = nums.count
        let indexedList: [(Int, Int)] = (0..<n).map() { ($0, nums[$0]) }.sorted(by: {$0.1 > $1.1})
        let textedList: [(Int, String)] = (0..<n).map() { 
            switch $0 {
                case 0: return (indexedList[$0].0, "Gold Medal")
                case 1: return (indexedList[$0].0, "Silver Medal")
                case 2: return (indexedList[$0].0, "Bronze Medal")
                default: return (indexedList[$0].0, "\($0 + 1)")
            }
        }.sorted(by: { $0.0 < $1.0 })
        return textedList.map() { $0.1 }
    }
}

