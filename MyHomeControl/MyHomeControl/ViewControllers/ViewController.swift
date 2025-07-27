//
//  ViewController.swift
//  MyHomeControl
//
//  Created by Артём Сноегин on 26.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel = UILabel()
    let usernameLabel = UILabel()
    let passwordLabel = UILabel()
    
    let usernameField = UITextField()
    let passwordField = UITextField()
    
    @IBOutlet weak var logInButton: UIButton!
    //    let logInButton = UIButton(configuration: .tinted())
    @IBOutlet weak var registerButton: UIButton!
    //    let registerButton = UIButton(configuration: .plain())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 0.5, alpha: 1)
        
        titleLabel.text = "My Home Control"
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.textColor = .white
        
        usernameLabel.text = "Username"
        usernameLabel.font = .preferredFont(forTextStyle: .title3)
        usernameLabel.textColor = .white
        
        usernameField.backgroundColor = .white
        usernameField.borderStyle = .roundedRect
        usernameField.placeholder = "Please enter username"
        
        passwordLabel.text = "Password"
        passwordLabel.font = .preferredFont(forTextStyle: .title3)
        passwordLabel.textColor = .white
        
        passwordField.backgroundColor = .white
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Please enter password"
        passwordField.isSecureTextEntry = true
        
        [titleLabel, usernameLabel, passwordLabel, usernameField, passwordField, logInButton, registerButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usernameLabel.bottomAnchor.constraint(equalTo: usernameField.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            usernameField.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -5),
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            passwordLabel.bottomAnchor.constraint(equalTo: passwordField.topAnchor),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 60),
            
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

