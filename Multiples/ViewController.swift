//
//  ViewController.swift
//  Multiples
//
//  Created by Yogesh Kumar on 05/02/16.
//  Copyright © 2016 itsyogesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var tableText: UITextField!
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var equalsLabel: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var answerText: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var againBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    
    var table = 0
    var multiplier = 0
    
    var correctAnswer = "Its correct!! Yay!"
    var wrongAnswer = "Oh-ho! Try again!"
    
    func restart() {
        logo.hidden = false
        tableText.hidden = false
        tableText.text = ""
        startBtn.hidden = false
        
        questionLabel.hidden = true
        equalsLabel.hidden = true
        answerLabel.hidden = true
        checkBtn.hidden = true
        againBtn.hidden = true
        answerText.hidden = true
        restartBtn.hidden = true
        equalsLabel.text = "="
    }
    
    func start() {
        logo.hidden = true
        tableText.hidden = true
        startBtn.hidden = true
        
        questionLabel.hidden = false
        equalsLabel.hidden = false
        checkBtn.hidden = false
        answerText.hidden = false
        answerText.text = ""
    }
    
    func textVerify (textField: UITextField!) -> Bool {
        if(textField.text != nil && textField.text != "") {
            return true
        } else {
            return false
        }
    }
    
    func randomNumber() -> Int {
        return Int(arc4random_uniform(UInt32(10)))
    }
    
    func generateQuestion(table: Int, var multiplier: Int){
        if(multiplier == 0){
            multiplier++
        }
        questionLabel.text = "\(table) x \(multiplier)"
    }
    
    func showGrade(text: String) {
        answerLabel.hidden = false
        answerLabel.text = text
        againBtn.hidden = false
        restartBtn.hidden = false
        checkBtn.hidden = true
    }
    
    @IBAction func onStart(startBtn: UIButton!) {
        if(textVerify(tableText)) {
            start()
            table = Int(tableText.text!)!
            generateQuestion(table, multiplier: randomNumber())
        }
    }
    
    @IBAction func onCheck(checkBtn: UIButton!) {
        
        if(textVerify(answerText)){
            let answer: Int = Int(answerText.text!)!
            if(answer == (table * multiplier)){
                showGrade(correctAnswer)
            } else {
                showGrade(wrongAnswer)
            }
        }
    }
    
    @IBAction func onRestart(restartBtn: UIButton!) {
        restart()
    }
    
    @IBAction func onAgain(againBtn: UIButton!) {
        generateQuestion(table, multiplier: randomNumber())
        answerLabel.hidden = true
        againBtn.hidden = true
        restartBtn.hidden = true
        checkBtn.hidden = false
        
    }
    

}

