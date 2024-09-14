//
//  ViewController.swift
//  AutoLayout-iOS13
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let logoImageView = UIImageView()
    let diceOneImageView = UIImageView()
    let diceTwoImageView = UIImageView()
    let rollButton = UIButton()
    
    let imageUIView = UIView()
    let dicesUIView = UIView()
    let dicesStackView = UIStackView()
    let buttonUIView = UIView()
    
    let images = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    private func setupView() {
        //ImageView
        imageView.image = UIImage(named: "GreenBackground")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageUIView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageUIView)
        
        dicesUIView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dicesUIView)
        
        dicesStackView.axis = .horizontal
        dicesStackView.spacing = 40
        dicesStackView.alignment = .fill
        dicesStackView.distribution = .fillEqually
        dicesStackView.translatesAutoresizingMaskIntoConstraints = false
        dicesUIView.addSubview(dicesStackView)
        
        buttonUIView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonUIView)
        
        //Logo
        logoImageView.image = UIImage(named: "DiceeLogo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        imageUIView.addSubview(logoImageView)
        
        //Dice 1
        diceOneImageView.image = UIImage(named: "DiceOne")
        diceOneImageView.translatesAutoresizingMaskIntoConstraints = false
        dicesStackView.addArrangedSubview(diceOneImageView)
        
        //Dice 2
        diceTwoImageView.image = UIImage(named: "DiceTwo")
        diceTwoImageView.translatesAutoresizingMaskIntoConstraints = false
        dicesStackView.addArrangedSubview(diceTwoImageView)
        
        //Button
        rollButton.setTitle("Roll", for: .normal)
        rollButton.setTitleColor(.white, for: .normal)
        rollButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        rollButton.layer.cornerRadius = 12
        rollButton.backgroundColor = hexStringToUIColor(hex: "#A02334")
        rollButton.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        buttonUIView.addSubview(rollButton)
        
        NSLayoutConstraint.activate([
            imageUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageUIView.heightAnchor.constraint(equalToConstant: 200),
            
            dicesUIView.topAnchor.constraint(equalTo: imageUIView.bottomAnchor),
            dicesUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            dicesUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            dicesUIView.heightAnchor.constraint(equalToConstant: 300),
            
            dicesStackView.centerYAnchor.constraint(equalTo: dicesUIView.centerYAnchor),
            dicesStackView.centerXAnchor.constraint(equalTo: dicesUIView.centerXAnchor),
            dicesStackView.heightAnchor.constraint(equalToConstant: 120),
            
            buttonUIView.topAnchor.constraint(equalTo: dicesStackView.bottomAnchor),
            buttonUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonUIView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            //ImageView
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            //Logo
            logoImageView.topAnchor.constraint(equalTo: imageUIView.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: imageUIView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: imageUIView.centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 120),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            //Dice 1
            diceOneImageView.widthAnchor.constraint(equalToConstant: 120),
            
            //Dice 2
            diceTwoImageView.widthAnchor.constraint(equalToConstant: 120),
            
            //Button
            rollButton.topAnchor.constraint(equalTo: buttonUIView.topAnchor, constant: 50),
            rollButton.centerXAnchor.constraint(equalTo: buttonUIView.centerXAnchor),
            rollButton.heightAnchor.constraint(equalToConstant: 60),
            rollButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 80)
        ])
    }
    
    @objc func rollButtonPressed() {
        guard let randomImageName1 = images.randomElement() else { return }
        guard let randomImageName2 = images.randomElement() else { return }
        diceOneImageView.image = UIImage(named: randomImageName1)
        diceTwoImageView.image = UIImage(named: randomImageName2)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
