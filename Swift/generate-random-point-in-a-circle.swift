/**
 * https://leetcode.com/problems/generate-random-point-in-a-circle/
 * 
 * 
 */ 
// Date: Thu Mar 18 15:53:30 PDT 2021
// Reference:
// https://leetcode.com/problems/generate-random-point-in-a-circle/discuss/154037/Polar-Coordinates-10-lines
class Solution {
    let x: Double
    let y: Double
    let r: Double
    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.r = radius
        self.x = x_center
        self.y = y_center
    }
    
    func randPoint() -> [Double] {
        let rr = sqrt(Double.random(in: 0.0 ... 1.0)) * self.r
        let angle = Double.random(in: 0.0 ... 1.0) * M_PI * 2.0
        let xx = rr * cos(angle)
        let yy = rr * sin(angle)
        return [self.x + xx, self.y + yy]
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(radius, x_center, y_center)
 * let ret_1: [Double] = obj.randPoint()
 */