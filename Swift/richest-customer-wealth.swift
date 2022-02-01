class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var result = 0
        for acc in accounts {
            let wealth = acc.reduce(0) { $0 + $1 }
            result = max(result, wealth)
        }
        return result
    }
}
