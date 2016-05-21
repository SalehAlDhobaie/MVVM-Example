//
//  GreetingModelView.swift
//  MVVM
//
//  Created by Saleh AlDhobaie on 3/28/16.
//  Copyright © 2016 Saleh AlDhobaie. All rights reserved.
//

import Foundation

protocol GreetingViewModelProtocol : class {
    
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set } // function to call when greeting did change
    init(person: Person)
    func showGreeting()
    
    var users: [String]? { get }
    func fetchUsers()
    var usersDidChange: ((GreetingViewModelProtocol) -> ())? { get set } // function to call
    
    
}

class GreetingViewModel : NSObject, GreetingViewModelProtocol {
    
    let person: Person
    var users : [String]? {
        didSet {
            self.usersDidChange?(self)
        }
    }
    
    var usersDidChange: ((GreetingViewModelProtocol) -> ())?
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    
    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)
        }
    }
    
    required init(person: Person) {
        self.person = person
    }
    
    func showGreeting() {
        let randomValue = arc4random() % 10
        self.greeting = "\(randomValue)." + " " + self.person.firstName + " " + self.person.lastName
    }
    
    
    func fetchUsers() {
        self.users = ["hi", "by"]
        
    }
    
    
    
}
