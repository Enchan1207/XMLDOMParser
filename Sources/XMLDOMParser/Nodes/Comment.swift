//
//  Comment.swift
//  XMLDOMParser
//
//  Created by EnchantCode on 2021/05/03.
//

import Foundation

class Comment: Node {
    private (set) public var uuid: NSUUID = NSUUID()
    var tagName: String = "#comment"
    var parent: Node?
    var children: [Node] = []
    var value: String
    
    public var description: String {
        get{
            return "<!-- \(self.value) -->"
        }
    }
    
    init(value: String, parent: Node? = nil){
        self.value = value
        self.parent = parent
    }
}
