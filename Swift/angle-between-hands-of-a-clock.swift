/**
 * https://leetcode.com/problems/angle-between-hands-of-a-clock/
 * 
 * 
 */ 
// Date: Tue Jul 14 07:13:21 PDT 2020
class Solution {
    /// With the exp of making app: https://apps.apple.com/us/app/spclock/id1233980440
    /// This one is quite similar.
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let minAngle = Double(minutes) * 6
        let hourAngle = Double(hour % 12) * 30 + Double(minutes) / 2
        let offset = abs(minAngle - hourAngle)
        return min(offset, 360.0 - offset)
    }
}
