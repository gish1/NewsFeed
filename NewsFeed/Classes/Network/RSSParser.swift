//
//  RSSParser.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020.
//  Copyright © 2020 Пк. All rights reserved.
//

import Foundation

class RSSParser: NSObject, XMLParserDelegate {
    var xmlParser: XMLParser!
    var currentElement = ""
    var foundCharacters = ""
    var currentData = [String:String]()
    var parsedData = [[String:String]]()
    var isHeader = true
    
    func startParsingWithContentOfURL(rssURL: URL, with completion: ([[String:String]])->()) {
         
        let parser = XMLParser(contentsOf: rssURL)
        parser?.delegate = self
        if (parser?.parse()) != nil {
            parsedData.append(currentData)
            completion(parsedData)
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        
        if currentElement == "item" {
            if isHeader == false {
                parsedData.append(currentData)
            }
            
            isHeader = false
        }
        
        if isHeader == false {
            if currentElement == "enclosure" {
                foundCharacters += attributeDict["url"]!
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if isHeader == false {
            if currentElement == "title" || currentElement == "pubDate" || currentElement == "yandex:full-text" || currentElement == "category" {
                
                foundCharacters += string.trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if !foundCharacters.isEmpty {
            
            currentData[currentElement] = foundCharacters
            foundCharacters = ""
        } 
    }
}
