//
//  day7.swift
//  
//
//  Created by Fabio Mauersberger on 07.12.22.
//

import Foundation

@objc
extension Y2022 {
    
    fileprivate func parseFS() -> [Directory] {
        var fs: [Directory] = []
        var tree: [Directory] = []
        for line in input {
            let coms = line.components(separatedBy: " ")
            if coms[0] == "$" { // command
                if coms[1] == "cd" {
                    if coms[2] == ".." { // go back
                        if let dir = tree.popLast() {
                            tree[tree.endIndex-1].append(dir)
                            fs.append(dir)
                        }
                    } else { // cd into directory
                        tree.append(Directory(name: coms[2], childs: []))
                    }
                }
            } else if let size = Int(coms[0]) { // file
                tree[tree.endIndex-1].append(File(name: coms[1], size: size))
            }
        }
        
        if var c = tree.popLast() {
            fs.append(c)
            while !tree.isEmpty {
                guard let new = tree.popLast() else { break }
                new.append(c)
                c = new
                fs.append(c)
            }
        }
        return fs
    }
    
    func day7part1() -> NSNumber {
        return NSNumber(value: parseFS().filter({$0.size <= 100000}).map({$0.size}).reduce(0, +))
    }
    
    func day7part2() -> NSNumber {
        let fs = parseFS()
        let unused = 70000000 - fs.last!.size
        print(fs.count, unused)
        return NSNumber(value: fs.sorted(by: {$0.size < $1.size}).first(where: { $0.size + unused >= 30000000})?.size ?? -1)
    }
}

@objc
fileprivate protocol FSNode {
    var name: String { get }
    var size: Int { get }
}

fileprivate class Directory: NSObject, FSNode {
    var name: String
    private(set) var size: Int
    private(set) var childs: [FSNode]
    
    init(name: String, size: Int = 0, childs: [FSNode]) {
        self.name = name
        self.size = size
        self.childs = childs
    }
    
    func append(_ item: FSNode) {
        childs.append(item)
        size += item.size
    }
}

fileprivate class File: NSObject, FSNode {
    init(name: String, size: Int) {
        self.name = name
        self.size = size
    }
    
    var name: String
    var size: Int
}

/*
 comment:
 Biggest issue with this day was not to parse the input but to calculate the size.
 My initial solution was to recursivly go through all elements, "collecting" their sizes. Which was bad because the author decided that nested files can be counted multiple times. AAAAAAa.
 The solutions from https://github.com/pwallrich/AOC2022-swift pointed me to calculating the sizes the moment when elements are added.
*/
