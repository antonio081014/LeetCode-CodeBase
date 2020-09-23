/**
 * https://leetcode.com/problems/gas-station/
 * 
 * 
 */ 
// Date: Wed Sep 23 15:37:58 PDT 2020
/// The idea is
/// 1. If the total gas - cost is greater or equal to 0, there will be a solution for sure.
/// 2. Then, to find the start station,
///     2.1 Start from station 0, sum all the gas - cost would be available in tank.
///     2.2 If at station `index`, the gas in tank is smaller than 0, then next station is not reachable.
///     2.3 Thus, from start to `index` is not a reachable path.
///     2.4 So, we start with next index, which is `index + 1`.
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var tank = 0
        var total = 0
        var start = 0
        for index in stride(from: 0, to: cost.count, by: 1) {
            tank += gas[index] - cost[index]
            if tank < 0 {
                total += tank
                tank = 0
                start = index + 1
            }
        }
        return (total + tank) < 0 ? -1 : start
    }
}
