class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: Set<[Int]> = []
        let sortedNums = nums.sorted()
        for index1 in 0..<sortedNums.count {
            if index1 > 0 && sortedNums[index1] == sortedNums[index1 - 1] { continue }
            let target = 0 - sortedNums[index1]
            var dict: Set<Int> = []
            for index2 in (index1+1) ..< sortedNums.count {
                if dict.contains(target - sortedNums[index2]) {
                    result.insert([sortedNums[index1], target - sortedNums[index2], sortedNums[index2]])
                }
                dict.insert(sortedNums[index2])
            }
        }
        return Array(result)
    }
}
