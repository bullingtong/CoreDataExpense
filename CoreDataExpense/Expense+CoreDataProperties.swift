//
//  Expense+CoreDataProperties.swift
//  CoreDataExpense
//
//  Created by Graeson Bullington on 4/18/19.
//  Copyright © 2019 Graeson Bullington. All rights reserved.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var amount: Double
    @NSManaged public var rawDate: NSDate?
    @NSManaged public var name: String?

}
