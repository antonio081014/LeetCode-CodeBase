
class Logger {

    private var logging: [String : Int]
    init() {
        self.logging = [:]
    }
    
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        if let lastTime = logging[message] {
            if timestamp - lastTime >= 10 {
                logging[message] = timestamp
                return true
            } else {
                return false
            }
        }
        logging[message] = timestamp
        return true
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */
