//
//  CoreDataStack.swift
//  WS1617_Mobu_MaKaMaGameshop
//
//  Created by Nathalie Kroj on 12.01.17.
//  Copyright © 2017 fhkl. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelUrl = Bundle.main.url(forResource: "ArticleDataModel", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelUrl)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator: NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let applicationDocumentsDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        let persistentStoreUrl: URL = applicationDocumentsDirectory.appendingPathComponent("ArticleObjectModel.sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreUrl, options: nil)
        }
        catch {
            fatalError("Persistent store error! \(error)")
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext: NSManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        
        return managedObjectContext
    }()
    
    func saveContext() {
        if self.managedObjectContext.hasChanges {
            do {
                try self.managedObjectContext.save()
            }
            catch {
                fatalError("There was an error saving the managed object context \(error)")
            }
        }
    }
}
