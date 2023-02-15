//
//  Group Controller.swift
//  AddressBook
//
//  Created by Colton Brenneman on 2/13/23.
//

import Foundation

class GroupController {
    
    static let sharedInstance = GroupController()
    
    var groups: [Group] = []
    
    //MARK: - Initializers
    
    init(){
        loadContactsFromDisk()
    }
    
    func createGroup(name: String = "Untitled Group", people: [Person] = []){
        let group = Group(name: name, person: people)
        groups.append(group)
        saveContactsToDisk()
    }
    
    func updateGroup(groupToUpdate: Group, groupNameToUpdate: String){
        groupToUpdate.name = groupNameToUpdate
        saveContactsToDisk()
    }
    
    func deleteGroup(groupToDelte: Group){
        guard let index = groups.firstIndex(of: groupToDelte) else {return}
        groups.remove(at: index)
        saveContactsToDisk()
    }
    
    private var fileURL: URL?{
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalURL = documentsDirectory.appendingPathComponent("person.json")
        return finalURL
    }
    
    func saveContactsToDisk() {
        //1.Get the address to save the file to
        guard let savedLocation = fileURL else {return}
        //2. Convert the Swift struct or calss into JSON Data
        do {
            let jsonData = try JSONEncoder().encode(groups)
            //3. Save (write) the data to the address from step 1.
            try jsonData.write(to: savedLocation)
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    func loadContactsFromDisk() {
        //1. Get the address the data is saved at
        guard let url = fileURL else {return}
        //2. Load that JSON data from the address
        do{
            let retrievedJSONData = try Data(contentsOf: url)
            //3. Convert from JSON to our Swift Model Object Type
            let decodedGroups = try JSONDecoder().decode([Group].self, from: retrievedJSONData)
            self.groups = decodedGroups
        } catch let error{
            print(error.localizedDescription)
        }
    }
}
