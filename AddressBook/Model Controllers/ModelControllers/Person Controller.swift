//
//  File.swift
//  AddressBook
//
//  Created by Colton Brenneman on 2/13/23.
//

import Foundation

class PersonController {
    
  
    //MARK: - CRUD Functions
    static func createPerson(name: String = "New Contact", address: String = "",group: Group){
        let newPerson = Person(name: name, address: address)
        group.person.append(newPerson)
        GroupController.sharedInstance.saveContactsToDisk()
    }
    
    static func updatePerson(personToUpdate: Person, newName: String, newAddress: String){
        personToUpdate.name = newName
        personToUpdate.address = newAddress
        GroupController.sharedInstance.saveContactsToDisk()
    }
    static func deletePerson(personToDelete: Person, from group: Group ){
        guard let index = group.person.firstIndex(of: personToDelete) else {return}
        group.person.remove(at: index)
       GroupController.sharedInstance.saveContactsToDisk()
    }
    
}
