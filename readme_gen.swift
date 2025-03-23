import Foundation

let absolutePath = "./"

struct Problem: CustomDebugStringConvertible {
    let seq: Int
    let qTitle: String
    let qSlug: String
    
    var debugDescription: String {
        return "\(seq) \(qSlug)"
    }
}

extension Problem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(seq)
    }
    
    static func == (lhs: Problem, rhs: Problem) -> Bool {
        return lhs.seq == rhs.seq
    }
}

extension Problem {
    init?(json: [String: Any]) {
        guard let seq = json["frontend_question_id"] as? Int,
            let qTitle = json["question__title"] as? String,
            let qSlug = json["question__title_slug"]  as? String
            else {
                return nil
        }
        self.seq = seq
        self.qTitle = qTitle
        self.qSlug = qSlug
    }
}

func importDataFromURL(_ url: String, with completionHandler: @escaping ([String: Any]) -> ()) {
    guard let mURL = URL(string: url) else {
        print("Invalid URL: \(url)")
        return
    }
    let request = URLRequest(url: mURL)
    let session = URLSession.shared
    
    let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
            return
        }
        guard let data = data else {
            print("Data could not be printed")
            return
        }
        guard let json = convert2JSON(from: data) else {
            print("Data could not be converted to JSON")
            return
        }
        //        print(" Data: \(json)")
        completionHandler(json)
    })
    task.resume()
    sleep(10)
}

func printout(for problemList: [Problem]) {
    print("| X | # | Question | \(Language.Swift)-\(countFiles(in: .Swift)) | \(Language.Java)-\(countFiles(in: .Java)) | \(Language.Python)-\(countFiles(in: .Python)) |")
    print("|---|---|---|---|---|---|")
    
    for problem in problemList {
        let swift = ifFileExists(problem.qSlug, in: .Swift) ? "[~~\(Language.Swift)~~](\(absolutePath)\(filesPath(in: .Swift))\(problem.qSlug).\(Language.Swift.extensionString))" : "\(Language.Swift)"
        let java = ifFileExists(problem.qSlug, in: .Java) ? "[~~\(Language.Java)~~](\(absolutePath)\(filesPath(in: .Java))\(problem.qSlug).\(Language.Java.extensionString))" : "\(Language.Java)"
        let python = ifFileExists(problem.qSlug, in: .Python) ? "[~~\(Language.Python)~~](\(absolutePath)\(filesPath(in: .Python))\(problem.qSlug).\(Language.Python.extensionString))" : "\(Language.Python)"
        let x = swift.count > 5 && java.count > 4 && python.count > 6
        ?
        " X " 
        : 
        "   "
        print("| \(x) | \(problem.seq) | \(problem.qTitle) | \(swift) | \(java) | \(python) ")
    }
}

func convert2JSON(from data: Data) -> [String: Any]? {
    do {
        guard let todo = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            print("error trying to convert data to JSON")
            return nil
        }
        return todo
    } catch  {
        print("error trying to convert data to JSON")
        return nil
    }
}

func normalizeJSON(_ json: [String: Any]) {
    var problemList = [Problem]()
    guard let list = json["stat_status_pairs"] as? [Any] else {
        print("Can't read list.")
        return
    }
    
    for case let item as [String: Any] in list {
        guard let info = item["stat"] as? [String: Any] else {
            print("Error: Invalid Problem Info.")
            continue
        }
        
        
        if let problem = Problem(json: info) {
            problemList.append(problem)
        } else {
            print("Error: Invalid Problem init?")
        }
        
    }
    
    //    problemList.sort(by: {return $0.seq > $1.seq})
    problemList.sort() {
        return $0.seq > $1.seq
    }
    
    printout(for: problemList)
}

enum Language {
    case Swift
    case Java
    case Python
    
    var extensionString: String {
        switch self {
        case .Swift:
            return "swift"
        case .Java:
            return "java"
        case .Python:
            return "py"
        }
    }
    
    var description: String {
        switch self {
        case .Swift:
            "Swift"
        case .Java:
            "Java"
        case .Python:
            "Python"
        }
    }
}

func countFiles(in lang: Language) -> Int {
    do {
        let fileManager = FileManager.default
        return try fileManager.contentsOfDirectory(atPath: filesPath(in: lang)).count
    } catch  {
        return 0
    }
}

func filesPath(in lang: Language) -> String {
    switch lang {
    case .Swift:
        return "./Swift/"
    case .Java:
        return "./Java/"
    case .Python:
        return "./Python/"
    }
}

func ifFileExists(_ name: String, in lang: Language) -> Bool {
    let fileManager = FileManager.default
    
    // Check if file exists, given its path
    return fileManager.fileExists(atPath: filesPath(in: lang) + name + "." + lang.extensionString)
}

// MARK: - Generate README.md
print("# LeetCode-CodeBase\n")
print("This repo presents all the solution I passed on LeetCode, should be used AS a Reference for study purpose.\n\n")
print("Usage: ")
print("1. Edit code in `code.swift` file")
print("2. `> ./generate.sh swift problem_identifier`\n")
print("1. Edit code in `code.py` file")
print("2. `> ./generate.sh python problem_identifier`\n")
print("1. Edit code in `code.java` file")
print("2. `> ./generate.sh java problem_identifier`\n")
print("Update README file only: ")
print("`> swift readme_gen.swift > README.md`\n\n")

let url = "https://leetcode.com/api/problems/algorithms/"
importDataFromURL(url, with: normalizeJSON)
