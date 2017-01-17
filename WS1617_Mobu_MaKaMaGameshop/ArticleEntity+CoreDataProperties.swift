//
//  ArticleEntity+CoreDataProperties.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Student on 17.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import Foundation
import CoreData


extension ArticleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleEntity> {
        return NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity");
    }

    @NSManaged public var gameImageName: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Float

}
