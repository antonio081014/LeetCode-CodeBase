//
//  FileManage.swift
//  GenREADME
//
//  Created by Antonio081014 on 2025-03-23.
//

import Foundation

struct FileManage {
    enum Error: Swift.Error {
        case fileNotExist
    }
    
    let fileManager = FileManager.default
    
    private func projectPath() -> URL? {
        guard
            let homeDirectory = URL.init(string: fileManager.currentDirectoryPath)
        else { return nil }
        return homeDirectory.deletingLastPathComponent()
    }
    
    private func readmeFilePath() -> URL? {
        guard let projDirectory = projectPath() else { return nil }
        return projDirectory.appending(component: "README.md")
    }
    
    func countFiles(in lang: Language) -> Int {
        do {
            return try fileManager.contentsOfDirectory(atPath: filesPath(in: lang).relativePath).filter{ $0.hasSuffix(lang.extensionString) }.count
        } catch  {
            return 0
        }
    }
    
    func filesPath(in lang: Language) throws -> URL {
        guard let projectPath = projectPath() else {
            throw Error.fileNotExist
        }
        switch lang {
        case .Swift:
            return projectPath.appending(component: "Swift")
        case .Java:
            return projectPath.appending(component: "Java")
        case .Python:
            return projectPath.appending(component: "Python")
        }
    }
    
    func filePath(_ fileName: String, in lang: Language) -> String {
        return lang.description + "/" + fileName
    }
    
    func ifFileExists(_ name: String, in lang: Language) -> Bool {
        do {
            let folderPath = try filesPath(in: lang)
            let filePath = folderPath.appending(component: name + "." + lang.extensionString)
            // Check if file exists, given its path
            return fileManager.fileExists(atPath: filePath.relativePath)
        } catch {
            return false
        }
    }
}
