//
//  ViewController.swift
//  Bankey
//
//  Created by Baurzhan Aubakirov on 01.04.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let titleDescriptionLabel = UILabel()
    let loginView = LoginView()
    let signingButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        self.loginView.usernameTextField.text
    }
    
    var password: String? {
        self.loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        
        // Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = "Bankey"
        
        // Title Description Label
        titleDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        titleDescriptionLabel.textAlignment = .center
        titleDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleDescriptionLabel.numberOfLines = 2
        titleDescriptionLabel.text = "Your premium source for all things banking"
        
        // Login View
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        // Sign In Button
        signingButton.translatesAutoresizingMaskIntoConstraints = false
        signingButton.configuration = .filled()
        signingButton.configuration?.imagePadding = 8 // for indicator spacing
        signingButton.setTitle("Sign In", for: [])
        signingButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        // Error message lable
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(titleDescriptionLabel)
        view.addSubview(loginView)
        view.addSubview(signingButton)
        view.addSubview(errorMessageLabel)
        
        // Title Label
        NSLayoutConstraint.activate([
            titleDescriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Title Description Label
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: titleDescriptionLabel.bottomAnchor, multiplier: 3),
            titleDescriptionLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleDescriptionLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // Sign In Button
        NSLayoutConstraint.activate([
            signingButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signingButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signingButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Error message label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signingButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

// MARK: Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should not be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Baur" && password == "welcome" {
            signingButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
