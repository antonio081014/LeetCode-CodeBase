/**
 * https://leetcode.com/problems/my-calendar-i/
 * 
 * 
 */ 
// Date: Thu Jun 10 13:48:37 PDT 2021

class MyCalendar {

    struct Event {
        let start: Int
        let end: Int
        
        func overlap(with otherEvent: Event) -> Bool {
            return (self.start >= otherEvent.start && self.start < otherEvent.end) || (otherEvent.start >= self.start && otherEvent.start < self.end)
        }
    }
    
    private var eventList: [Event]
    
    init() {
        self.eventList = []
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        let event = Event(start: start, end: end)
        for e in eventList {
            if e.overlap(with: event) {
                return false
            }
        }
        self.eventList.append(event)
        return true
    }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * let obj = MyCalendar()
 * let ret_1: Bool = obj.book(start, end)
 */