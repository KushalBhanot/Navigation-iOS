//
//  ViewController.swift
//  Navigation
//
//  Created by kushal on 06/01/21.
//

import UIKit

protocol NameDelegate: class {
    func changeButtonName(newTitle: String)
}

class ViewController: UIViewController {

    var pushNavViewControllerButton: UIButton!
    var presentModalViewControllerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Set the navigation controller's title!

        pushNavViewControllerButton = UIButton()
        pushNavViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushNavViewControllerButton.setTitle("Push Navigation VC", for: .normal)
        pushNavViewControllerButton.setTitleColor(.white, for: .normal)
        pushNavViewControllerButton.backgroundColor = .blue
        pushNavViewControllerButton.layer.cornerRadius = 4
        pushNavViewControllerButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        view.addSubview(pushNavViewControllerButton)
          
        presentModalViewControllerButton = UIButton()
        presentModalViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        presentModalViewControllerButton.setTitle("Present Modal VC [change my name]", for: .normal)
        presentModalViewControllerButton.setTitleColor(.white, for: .normal)
        presentModalViewControllerButton.backgroundColor = .red
        presentModalViewControllerButton.layer.cornerRadius = 4
        presentModalViewControllerButton.addTarget(self, action: #selector(presentModalViewController), for: .touchUpInside)
        view.addSubview(presentModalViewControllerButton)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            pushNavViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushNavViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushNavViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])

        NSLayoutConstraint.activate([
            presentModalViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentModalViewControllerButton.topAnchor.constraint(equalTo: pushNavViewControllerButton.bottomAnchor, constant: 16),
            presentModalViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
    }

    @objc func pushNavViewController() {
        let newViewController = BlueViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }

    @objc func presentModalViewController() {
        let newViewController = RedViewController(placeholder: presentModalViewControllerButton.titleLabel?.text ?? "Placeholder")
        newViewController.delegate = self
        present(newViewController, animated: true, completion: nil)
    }
}

extension ViewController: NameDelegate {
    func changeButtonName(newTitle: String) {
        presentModalViewControllerButton.setTitle(newTitle, for: .normal)
    }
}
