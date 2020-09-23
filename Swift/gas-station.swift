/**
 * https://leetcode.com/problems/gas-station/
 * 
 * 
 */ 
// Date: Wed Sep 23 15:37:58 PDT 2020
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