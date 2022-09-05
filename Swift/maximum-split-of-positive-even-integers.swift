class Solution {
    func maximumEvenSplit(_ finalSum: Int) -> [Int] {
        guard finalSum % 2 == 0 else { return [] }
        var result = [Int]()
        var sum = 0
        var inc = 2
        while (sum + inc) <= finalSum {
            result.append(inc)
            sum += inc
            inc += 2
        }
        if sum < finalSum {
            result[result.count - 1] += finalSum - sum
        }
        return result
    }
}
