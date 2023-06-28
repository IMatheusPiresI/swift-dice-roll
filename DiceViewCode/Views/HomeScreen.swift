//
//  HomeScreen.swift
//  DiceViewCode
//
//  Created by Matheus Sousa on 27/06/23.
//

import UIKit


class HomeScreen: UIView {
    
    private let diceImages: [UIImage?] = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix"),
    ]
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "GreenBackground")
        
        return image
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DiceeLogo")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var diceImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DiceOne")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var diceImageTwo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DiceSix")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var buttonRoll: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var stackViewButtonRoll: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(buttonRoll)
        return stackView
    }()
    
    lazy var diceRowView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
    
        stackView.addArrangedSubview(diceImage)
        stackView.addArrangedSubview(diceImageTwo)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.logoImage)
        self.addSubview(self.diceRowView)
        self.addSubview(self.stackViewButtonRoll)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error initialize HomeScreen")
    }
    
    @objc func buttonPressed(){
        let randomNum1 = Int.random(in: 0 ... 5)
        let randomNum2 = Int.random(in: 0 ... 5)
        
        diceImage.image = diceImages[randomNum1]
        diceImageTwo.image = diceImages[randomNum2]
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 65),
            
            self.diceRowView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.diceRowView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.diceRowView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            
            self.diceImage.widthAnchor.constraint(equalToConstant: 75),
            self.diceImage.heightAnchor.constraint(equalToConstant: 75),
            
            self.diceImageTwo.widthAnchor.constraint(equalToConstant: 75),
            self.diceImageTwo.heightAnchor.constraint(equalToConstant: 75),
            
            self.stackViewButtonRoll.topAnchor.constraint(equalTo: self.diceRowView.bottomAnchor, constant: 120),
            self.stackViewButtonRoll.centerXAnchor.constraint(equalTo: self.centerXAnchor
                                                             ),
            
            self.buttonRoll.widthAnchor.constraint(equalToConstant: 84),
            self.buttonRoll.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
}
