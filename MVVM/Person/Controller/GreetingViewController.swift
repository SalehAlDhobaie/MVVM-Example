//
//  GreetingViewController.swift
//  MVVM
//
//  Created by Saleh AlDhobaie on 3/28/16.
//  Copyright © 2016 Saleh AlDhobaie. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {
    
    @IBOutlet weak var showGreetingButton : UIButton!
    @IBOutlet weak var greetingLabel : UILabel!
    
    @IBOutlet weak var showUsersButton : UIButton!
    var users : [String]?
    
    
    var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
                // property 2 , 3, 4, .. etc
            }
            self.viewModel.usersDidChange = { [unowned self] viewModel in
                self.users = viewModel.users
                print(viewModel.users)
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = Person(firstName: "David", lastName: "Blaine")
        let viewModel = GreetingViewModel(person: model)
        self.viewModel = viewModel
        showGreetingButton.addTarget(self.viewModel, action: #selector(GreetingViewModel.showGreeting), forControlEvents: .TouchUpInside);
        
        
        showUsersButton.addTarget(self.viewModel, action: #selector(GreetingViewModel.fetchUsers), forControlEvents: .TouchUpInside);
        
    }
    // layout code goes here
}
