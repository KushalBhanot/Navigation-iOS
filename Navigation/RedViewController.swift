//
//  RedViewController.swift
//  Navigation
//
//  Created by kushal on 21/01/21.
//

import UIKit

class RedViewController: UIViewController {
    
    weak var delegate: NameDelegate?
    
    var button: UIButton!
    var textField: UITextField!
    
    var placeholderText: String
    
    init(placeholder: String) {
        self.placeholderText = placeholder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = placeholderText
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.clearsOnBeginEditing = true
        view.addSubview(textField)
        
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dismiss and save text", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.setTitleColor(.red, for: .normal)
        
        // When the button is pressed, dismiss this ModalViewController and change the button name
        button.addTarget(self, action: #selector(dismissViewControllerAndSaveText), for: .touchUpInside)
        view.addSubview(button)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // textField constraints
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        // button constraints
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc func dismissViewControllerAndSaveText() {
        if let text = textField.text, text != "" {
            delegate?.changeButtonName(newTitle: text)
        }
        dismiss(animated: true, completion: nil)
    }
}
