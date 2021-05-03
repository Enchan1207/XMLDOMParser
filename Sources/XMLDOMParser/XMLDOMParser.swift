//
//  XMLDOMParser.swift
//  XMLDOMParser
//
//  Created by EnchantCode on 2021/05/03.
//

import Foundation

public class XMLDOMParser: NSObject {
    private var parser: XMLParser!
    
    private var rootNode: Node? // ルートノード 全てのノードはこのノードのchildren
    private var currentNode: Node! // 次にappendChildするべきノード
    
    private var success: ((_ node: Node) -> Void)!
    private var failure: ((_ error: Error) -> Void)!
    
    public init(data: Data){
        super.init()

        self.parser = XMLParser(data: data)
        self.parser.delegate = self
        self.currentNode = rootNode
    }
    
    public func parse(success: @escaping (_ node: Node) -> Void, failure: @escaping (_ error: Error) -> Void){
        self.success = success
        self.failure = failure
        
        self.parser.parse()
        
    }
}

extension XMLDOMParser: XMLParserDelegate {
    
    public func parserDidStartDocument(_ parser: XMLParser) {
        // start of document
    }
    
    public func parserDidEndDocument(_ parser: XMLParser) {
        self.success(self.rootNode!)
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // Elementを生成してpushし、currentNodeをずらす
        let newElement = Element(tagName: elementName, attributes: attributeDict)
        self.currentNode?.appendChild(newElement)
        self.currentNode = newElement
        
        if self.rootNode == nil{
            self.rootNode = newElement
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        // currentNodeをひとつ戻す
        self.currentNode = self.currentNode.parent
    }
    
    public func parser(_ parser: XMLParser, foundComment comment: String) {
        // Commentを生成してpush
        let newText = Comment(value: comment)
        self.currentNode?.appendChild(newText)
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        // Textを生成してpush
        let newText = Text(value: string)
        self.currentNode?.appendChild(newText)
    }
    
    public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        failure(parseError as NSError)
    }
}
