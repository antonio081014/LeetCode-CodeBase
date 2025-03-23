/**
 * https://leetcode.com/problems/two-sum/
 * 
 * 
 */ 
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for start in range(len(nums)):
            for end in range(start + 1, len(nums)):
                if nums[start] + nums[end] == target:
                    return [start, end]
        return []
