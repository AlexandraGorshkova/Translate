//
//  Words+CoreDataProperties.swift
//  Translate
//
//  Created by Alexandra Gorshkova on 03/06/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//
//

import Foundation
import CoreData


extension Words {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Words> {
        return NSFetchRequest<Words>(entityName: "Words")
    }

    @NSManaged public var word: String?
    @NSManaged public var translate: String?

}
