/**
 * https://leetcode.com/problems/can-place-flowers/
 * 
 * 
 */ 
// Date: Mon Dec  7 15:50:55 PST 2020
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var index = 0
        var result = 0
        while index < flowerbed.count {
            if flowerbed[index] == 0, (index == 0 || flowerbed[index - 1] == 0), (index + 1 == flowerbed.count || flowerbed[index + 1] == 0) {
                flowerbed[index] = 1
                result += 1
                
                if result >= n { return true }
            }
            if result >= n { return true }
            
            index += 1
        }
        return false
    }
}