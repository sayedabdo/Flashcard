//
//  Flashcard+CoreDataProperties.swift
//  Flashcard
//
//  Created by Sayed Abdo on 2/7/18.
//  Copyright © 2018 sayedAbdo. All rights reserved.
//
//

import Foundation
import CoreData


extension Flashcard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flashcard> {
        return NSFetchRequest<Flashcard>(entityName: "Flashcard")
    }
    @NSManaged public var question: String?
    @NSManaged public var answer: String?
    @NSManaged public var subject: String?

}
