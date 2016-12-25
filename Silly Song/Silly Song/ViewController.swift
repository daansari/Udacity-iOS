//
//  ViewController.swift
//  Silly Song
//
//  Created by Danish Ahmed Ansari on 12/25/16.
//  Copyright © 2016 Danish Ahmed Ansari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let bananaFanaTemplate = [
            "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
            "Banana Fana Fo F<SHORT_NAME>",
            "Me My Mo M<SHORT_NAME>",
            "<FULL_NAME>"].joined(separator: "\n")
        
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
    
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
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        var lyricsTemplate = lyricsTemplate
        let fullName = fullName
        let shortName = shortNameFromName(name: fullName)
        
        lyricsTemplate = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        return lyricsTemplate
    }

}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
