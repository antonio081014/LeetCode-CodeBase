class Solution {
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var count: [[Int] : Int] = [:]
        dominoes.map { count[[min($0[0], $0[1]), max($0[0], $0[1])], default:0] += 1 }
        
        var result = 0
        for v in count.values {
            if v > 1 {
                result += v * (v - 1) / 2
            }
        }
        return result
    }
}
