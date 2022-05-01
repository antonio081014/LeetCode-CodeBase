class Solution {
    func minimumCardPickup(_ cards: [Int]) -> Int {
        var result = cards.count + 1
        var record = [Int : Int]()
        for (index, c) in cards.enumerated() {
            if let lastIndex = record[c] {
                result = min(result, index - lastIndex + 1)
            }
            record[c] = index
        }
        return result == (cards.count + 1) ? -1 : result
    }
}
