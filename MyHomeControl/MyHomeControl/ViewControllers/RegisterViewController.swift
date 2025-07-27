//
//  RegisterViewController.swift
//  MyHomeControl
//
//  Created by Артём Сноегин on 27.07.2025.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let titleLabel = UILabel()
    let usernameLabel = UILabel()
    let passwordLabel = UILabel()
    let confirmationLabel = UILabel()
    
    let usernameField = UITextField()
    let passwordField = UITextField()
    let confirmationField = UITextField()
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.3, green: 0.5, blue: 0.7, alpha: 1)
        
        titleLabel.text = "Registration Form"
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
        
        confirmationLabel.text = "Confirm password"
        confirmationLabel.font = .preferredFont(forTextStyle: .title3)
        confirmationLabel.textColor = .white
        
        confirmationField.backgroundColor = .white
        confirmationField.borderStyle = .roundedRect
        confirmationField.placeholder = "Please confirm password"
        
        [titleLabel, usernameLabel, passwordLabel, usernameField, passwordField, confirmationLabel, confirmationField, saveButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usernameLabel.bottomAnchor.constraint(equalTo: usernameField.topAnchor, constant: -5),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            usernameField.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -10),
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            passwordLabel.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -5),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            confirmationLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
            confirmationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            confirmationField.topAnchor.constraint(equalTo: confirmationLabel.bottomAnchor, constant: 5),
            confirmationField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            confirmationField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: confirmationField.bottomAnchor, constant: 60)

        ])
    }
}
