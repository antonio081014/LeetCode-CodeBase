/**
 * https://leetcode.com/problems/top-k-frequent-elements/
 * 
 * 
 */ 
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let map = nums.reduce([Int:Int](), {
            var dict = $0
            if dict[$1]==nil {
                dict[$1] = 1
            } else {
                dict[$1] = 1 + dict[$1]!
            }
            return dict
        }).reduce([Int:[Int]](), {
            dict, item in
            var dict_r = dict
            if dict_r[item.value]==nil{
                dict_r[item.value] = [item.key]
            } else {
                dict_r[item.value] = dict_r[item.value]! + [item.key]
            }
            return dict_r
        })
        
        var count = k
        var maxn = nums.count
        var ret = [Int]()
        while count>0, maxn>0 {
            if let list = map[maxn] {
                var i = 0
                while i<count, i<list.count {
                    ret += [list[i]]
                    i += 1
                }
                count -= i
            }
            maxn -= 1
        }
        return ret
    }
}
/**
 * https://leetcode.com/problems/top-k-frequent-elements/
 * 
 * 
 */ 
// Date: Fri Jul 17 10:16:22 PDT 2020
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // 1. count the freq of each num in nums.
        var count: [Int: Int] = [:]
        for n in nums {
            count[n] = 1 + count[n, default: 0]
        }
        // 2. Turn the dictionary into an Array.
        var list: [(Int, Int)] = []
        for (key, value) in count {
            list.append((key, value))
        }
        // 3. Sort the array by the freq.
        list = list.sorted(by: {
            $0.1 > $1.1
        })
        // 4. Return first k elements with first value in the tuple.
        return Array(list[0 ..< k].map { $0.0 })
    }
}
/**
 * https://leetcode.com/problems/top-k-frequent-elements/
 * 
 * 
 */ 
// Date: Fri Jul 17 10:49:12 PDT 2020
class Solution {
    /// Bucket Sort
    /// - Complexity:
    ///     - Time: O(n), n is the number of elements in nums.
    ///     - Space: O(n), n is the number of elements in nums
    ///
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var count: [Int: Int] = [:]
        for n in nums {
            count[n] = 1 + count[n, default: 0]
        }
        var bucket: [[Int]] = Array(repeating: [], count: nums.count + 1)
        for (key, value) in count {
            if bucket[value] == nil {
                bucket[value] = []
            }
            bucket[value].append(key)
        }
        var result: [Int] = []
        for index in stride(from: nums.count, through: 0, by: -1) {
            if bucket[index] != nil, bucket[index].isEmpty == false {
                result += bucket[index]
            }
            if result.count >= k {
                return result
            }
        }
        return result
    }
}
