//: Playground - noun: a place where people can play

import UIKit
import Foundation

func shortNameFromName(name: String) -> String {
    // implementation here
    let vowelCharacterset = CharacterSet.init(charactersIn: "aeiou")
    var name = name.lowercased().folding(options: String.CompareOptions.diacriticInsensitive, locale: NSLocale.current)
    let range = name.startIndex..<name.index(after: name.startIndex)
    while ((name.rangeOfCharacter(from: vowelCharacterset, options: String.CompareOptions.diacriticInsensitive, range: range)) == nil) {
        name = name.substring(from: name.index(after: name.startIndex))
    }
    return name
}

shortNameFromName(name: "Nate")
// Shows 'ate'
shortNameFromName(name: "Zöe")
// Shows 'alia'

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    var lyricsTemplate = lyricsTemplate
    let fullName = fullName
    let shortName = shortNameFromName(name: fullName)
    
    lyricsTemplate = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyricsTemplate
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")
lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Zöe")
