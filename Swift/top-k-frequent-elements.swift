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
