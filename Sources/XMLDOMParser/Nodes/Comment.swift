//
//  Comment.swift
//  XMLDOMParser
//
//  Created by EnchantCode on 2021/05/03.
//

import Foundation

public class Comment: Node {
    private (set) public var uuid: NSUUID = NSUUID()
    public var tagName: String = "#comment"
    public var parent: Node?
    public var children: [Node] = []
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
