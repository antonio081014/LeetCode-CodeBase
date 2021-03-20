/**
 * https://leetcode.com/problems/design-underground-system/
 * 
 * 
 */ 
// Date: Sat Mar 20 08:47:11 PDT 2021

class UndergroundSystem {

    struct StationTimestamp {
        let station: String
        let time: Int
        
        init(_ name: String, at time: Int) {
            self.station = name
            self.time = time
        }
    }
    
    var customerCheckin: [Int : StationTimestamp]
    
    var timecost: [String : (Int, Int)]
    
    init() {
        self.customerCheckin = [:]
        self.timecost = [:]
    }
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        self.customerCheckin[id] = StationTimestamp(stationName, at: t)
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        guard let checkin = customerCheckin[id] else { return }
        let route = self.routeName(checkin.station, stationName)
        var cost = self.timecost[route, default: (0, 0)]
        self.timecost[route] = (cost.0 + t - checkin.time, cost.1 + 1)
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let route = self.routeName(startStation, endStation)
        guard let (totalTime, times) = self.timecost[route] else { return 0.0 }
        return Double(totalTime) / Double(times)
    }
    
    private func routeName(_ from: String, _ to: String) -> String {
        return from + "-" + to
    }
}

/**
 * Your UndergroundSystem object will be instantiated and called as such:
 * let obj = UndergroundSystem()
 * obj.checkIn(id, stationName, t)
 * obj.checkOut(id, stationName, t)
 * let ret_3: Double = obj.getAverageTime(startStation, endStation)
 */