//
//  ViewController.swift
//  Silly Song
//
//  Created by Sohaib on 05/10/2017.
//  Copyright © 2017 Sohaib. All rights reserved.
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
        if(nameField.text != ""){
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
}

//Shortened Version of name for silly songs app function
func shortNameFromName (_ fullName: String) -> String{
    let lowerCasedName: String = fullName.lowercased()
    let vS = "aeiou"
    var shortName = ""
    for character in lowerCasedName{
        for char in vS{
            if char == character{
                var nname: [String] = lowerCasedName.components(separatedBy: String(char))
                //var nname: [String] = lowerCasedName.replac
                nname[0].append(char)
                shortName = String(char) + "" + nname[1]
                return shortName
            }
        }
    }
    return lowerCasedName
}

//print(shortNameFromName("Nate"))

func lyricsForName (lyricsTemplate: String, fullName: String) -> String {
    let shortName: String = shortNameFromName(fullName)
    let newTemplate = lyricsTemplate
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    return newTemplate
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

//print(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Nate"))

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
