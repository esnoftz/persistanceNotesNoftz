//
//  ViewController.swift
//  persistanceNotesNoftz
//
//  Created by EVANGELINE NOFTZ on 10/16/24.
//

import UIKit

// adopts codable protocol
public class Dog: Codable {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}




class ViewController: UIViewController {

    @IBOutlet weak var hsOutlet: UITextField!
    
    @IBOutlet weak var hsLabel: UILabel!
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // gives us access to storage on the phone
    var defaults = UserDefaults.standard
    
    // json is key value pairs
    var encoder = JSONEncoder()
    
    var decoder = JSONDecoder()
    
    var names = ["Billy", "Bob", "Joe"]
    var dogs = [Dog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        // get stuff from the phone
        // if you give it a key that doesn't exist, nil is NOT returned (instead, there is a default value of 0 for ints)
        var hs = defaults.integer(forKey: "highScore")
        
        print(hs)
        hsLabel.text = "\(hs)"
        var nm = defaults.string(forKey: "theName")
        nameLabel.text = nm
        
        
        var dog = defaults.object(forKey: "theNames")
        if let d = dog {
            let dd = d as! [String] // casting to string array (guarenteed)
            for something in dd {
                print(something)
            }
        }
        
        
        dogs.append(Dog(name: "Bowser", age: 12))
        dogs.append(Dog(name: "Waldo", age: 10))
        
        var blahDogs = defaults.data(forKey: "theDogs")
        
    }

    
    @IBAction func saveAction(_ sender: UIButton) {
        
        var blah = Int(hsOutlet.text!)!
        var blahName = nameOutlet.text!
        
        // dictionary that has key (highScore) and value (150)
        // saving to the phone
        defaults.set(blah, forKey: "highScore")
        defaults.set(blahName, forKey: "theName")
        
        defaults.set(names, forKey: "theNames")
        
        
        
        encoder.encode(dogs)
        defaults.set(dogs, forKey: "theDogs")
        
    }
    
    
    

}

