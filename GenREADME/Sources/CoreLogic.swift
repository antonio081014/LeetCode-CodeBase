//
//  CoreLogic.swift
//  GenREADME
//
//  Created by Antonio081014 on 2025-03-23.
//

struct CoreLogic {
    private let fileManager = FileManage()
    private let dataProcessor = DataProcessing()
    private let absolutePath = "./"
    
    func coreFucntion() async throws {
        // try await write2README()
        // print("Source Folder", try fileManager.filesPath(in: .Swift).pathComponents)
        try await write2README()
    }
    
    // MARK: - Generate README.md
    private func write2README() async throws {
        print("# LeetCode-CodeBase\n")
        print("This repo presents all the solution I passed on LeetCode, should be used AS a Reference for study purpose.\n\n")
        print("Usage: ")
        print("1. Edit code in `code.swift` file\n")
        print("    2. `> ./generate.sh swift problem_identifier`\n")
        print("1. Edit code in `code.py` file\n")
        print("    2. `> ./generate.sh python problem_identifier`\n")
        print("1. Edit code in `code.java` file\n")
        print("    2. `> ./generate.sh java problem_identifier`\n")
        print("Update README file only: \n")
        print("    Change directory to `GenREADME` folder\n")
        print("    `> swift run > README.md`\n\n")
        
        let url = "https://leetcode.com/api/problems/algorithms/"
        let json = try await dataProcessor.importDataFromURL(url)
        let problemList = try dataProcessor.normalizeJSON(json)
        try printout(for: problemList)
    }
    
    private func printout(for problemList: [Problem]) throws {
        print("| X | # | Question | \(Language.Swift)-\(fileManager.countFiles(in: .Swift)) | \(Language.Java)-\(fileManager.countFiles(in: .Java)) | \(Language.Python)-\(fileManager.countFiles(in: .Python)) |")
        print("|---|---|---|---|---|---|")
        
        for problem in problemList {
            let swift = fileManager.ifFileExists(problem.qSlug, in: .Swift) ? "[~~\(Language.Swift)~~](\(fileManager.filePath("\(problem.qSlug).\(Language.Swift.extensionString)", in: .Swift)))" : "\(Language.Swift)"
            let java = fileManager.ifFileExists(problem.qSlug, in: .Java) ? "[~~\(Language.Java)~~](\(fileManager.filePath("\(problem.qSlug).\(Language.Java.extensionString)", in: .Java)))" : "\(Language.Java)"
            let python = fileManager.ifFileExists(problem.qSlug, in: .Python) ? "[~~\(Language.Python)~~](\(fileManager.filePath("\(problem.qSlug).\(Language.Python.extensionString)", in: .Python)))" : "\(Language.Python)"
            let x = swift.count > 5 && java.count > 4 && python.count > 6
            ?
            " X "
            :
            "   "
            print("| \(x) | \(problem.seq) | \(problem.qTitle) | \(swift) | \(java) | \(python) ")
        }
    }
}
