//
//  ControlPageViewController.swift
//  MyHomeControl
//
//  Created by Артём Сноегин on 27.07.2025.
//

import UIKit

class ControlPageViewController: UIViewController {
    
    let backgroundImage = UIImageView(image: .pinkMeshGradient)
    
    let welcomeLabel = UILabel()
    let titleLabel = UILabel()
    let lightsLabel = UILabel()
    let doorLabel = UILabel()
    let acLabel = UILabel()
    let temperatureLabel = UILabel()
    
    let lightsSegmentedControl = UISegmentedControl()
    let doorSegmentedControl = UISegmentedControl()
    let acSegmentedControl = UISegmentedControl()
    
    @IBOutlet weak var temperatureSlider: UISlider!
    var temperatureValueLabel = UILabel()
    
    let alarmButton = UIButton(configuration: .filled())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.8, green: 0.4, blue: 0.3, alpha: 1)
        
        welcomeLabel.text = "Welcome, new user!"
        welcomeLabel.font = .preferredFont(forTextStyle: .extraLargeTitle)
        welcomeLabel.textColor = .black
        
        titleLabel.text = "Apartment control page🏡"
        titleLabel.font = .preferredFont(forTextStyle: .extraLargeTitle2)
        titleLabel.textColor = .black
        
        lightsLabel.text = "Lights"
        lightsLabel.font = .preferredFont(forTextStyle: .body)
        lightsLabel.textColor = .black
        
        lightsSegmentedControl.insertSegment(withTitle: "On", at: 0, animated: true)
        lightsSegmentedControl.insertSegment(withTitle: "Off", at: 1, animated: true)
        lightsSegmentedControl.selectedSegmentIndex = 0
        
        doorLabel.text = "Door"
        doorLabel.font = .preferredFont(forTextStyle: .body)
        doorLabel.textColor = .black
        
        doorSegmentedControl.insertSegment(withTitle: "Lock", at: 0, animated: true)
        doorSegmentedControl.insertSegment(withTitle: "Unlock", at: 1, animated: true)
        doorSegmentedControl.selectedSegmentIndex = 0
        
        acLabel.text = "A/C"
        acLabel.font = .preferredFont(forTextStyle: .body)
        acLabel.textColor = .black
        
        acSegmentedControl.insertSegment(withTitle: "Auto", at: 0, animated: true)
        acSegmentedControl.insertSegment(withTitle: "On", at: 1, animated: true)
        acSegmentedControl.insertSegment(withTitle: "Off", at: 2, animated: true)
        acSegmentedControl.selectedSegmentIndex = 0
        
        temperatureLabel.text = "Temperature"
        temperatureLabel.font = .preferredFont(forTextStyle: .body)
        temperatureLabel.textColor = .black
        
        temperatureSlider.minimumValue = 15
        temperatureSlider.maximumValue = 35
        temperatureSlider.value = 21
        
        temperatureValueLabel.text = "\(Int(temperatureSlider.value))℃"
        temperatureValueLabel.font = .preferredFont(forTextStyle: .body)
        temperatureValueLabel.textColor = .black
        
        alarmButton.setTitle("Alarm", for: .normal)
        alarmButton.setTitleColor(.red, for: .normal)
        alarmButton.tintColor = .white
        
        

        
        [backgroundImage, welcomeLabel, titleLabel, lightsLabel, doorLabel, acLabel, temperatureLabel, lightsSegmentedControl, doorSegmentedControl, acSegmentedControl, temperatureSlider, temperatureValueLabel, alarmButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            welcomeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lightsLabel.bottomAnchor.constraint(equalTo: lightsSegmentedControl.topAnchor, constant: -5),
            lightsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            lightsSegmentedControl.bottomAnchor.constraint(equalTo: doorLabel.topAnchor, constant: -10),
            lightsSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            lightsSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
            
            doorLabel.bottomAnchor.constraint(equalTo: doorSegmentedControl.topAnchor, constant: -5),
            doorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            doorSegmentedControl.bottomAnchor.constraint(equalTo: acLabel.topAnchor, constant: -10),
            doorSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            doorSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
            
            acLabel.bottomAnchor.constraint(equalTo: acSegmentedControl.topAnchor, constant: -5),
            acLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            acSegmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            acSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            acSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
            
            temperatureLabel.topAnchor.constraint(equalTo: acSegmentedControl.bottomAnchor, constant: 15),
            temperatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            temperatureSlider.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 5),
            temperatureSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            temperatureSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
            temperatureValueLabel.centerYAnchor.constraint(equalTo: temperatureSlider.centerYAnchor),
            temperatureValueLabel.leadingAnchor.constraint(equalTo: temperatureSlider.trailingAnchor, constant: 10),
            
            alarmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            alarmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        temperatureValueLabel.text = "\(Int(temperatureSlider.value))℃"
    }
}
