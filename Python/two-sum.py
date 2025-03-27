/**
 * https://leetcode.com/problems/two-sum/
 * 
 * 
 */ 

// Date Sun Mar 23 16:10:39 PDT 2025
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for start in range(len(nums)):
            for end in range(start + 1, len(nums)):
                if nums[start] + nums[end] == target:
                    return [start, end]
        return []
/**
 * https://leetcode.com/problems/two-sum/
 * 
 * 
 */ 
// Date: Thu Mar 27 16:50:15 PDT 2025
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        hashmap = {}
        for index in range(len(nums)):
            left = target - nums[index]
            if left in hashmap:
                return [hashmap[left], index]
            hashmap[nums[index]] = index
        return []

