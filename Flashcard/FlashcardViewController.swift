//
//  FlashcardViewController.swift
//  Flashcard
//
//  Created by Sayed Abdo on 2/7/18.
//  Copyright © 2018 sayedAbdo. All rights reserved.
//
//  sayed.m.abdo123@gmail.com // 01065778840 
import UIKit
import CoreData

class FlashcardViewController: UIViewController {
    
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var subjectTextField: UITextField!
    
    var managedObjectContext : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveCardAction(_ sender: UIButton) {
        guard let subject = subjectTextField.text else { return }
        guard let question = questionTextView.text else { return }
        guard let answer = answerTextView.text else { return }
        saveCardToDatabase(subject: subject, question: question, answer: answer)
    }
    
    func saveCardToDatabase(subject: String, question: String, answer: String) {
        let newFlashcard = NSEntityDescription.insertNewObject(forEntityName: "Flashcard", into: managedObjectContext) as! Flashcard
        newFlashcard.subject = subject
        newFlashcard.question = question
        newFlashcard.answer = answer
        
        do {
            try managedObjectContext.save()
            print("Flashcard saved successfully")
        } catch {
            print("Could not save managedObjectContext state, flashcard not saved")
        }
    }
    
}

