//
//  ViewController.swift
//  vkclient
//
//  Created by Ильдар Маннанов on 11.01.2018.
//  Copyright © 2018 mif. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController {
    
    private let TEST_USR_LOGIN = "user"
    private let TEST_USR_PSWD = "123"
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action:  #selector(self.hideKeyboard))
        // присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard checkAuth() else { // аутентификация не прошла - показваем ошибку
            showLoginError();
            return false
        }  
        return true
    }

    
    func checkAuth() -> Bool {
        let login = loginTextField.text!
        let pass = passwordTextField.text!
        if login == TEST_USR_LOGIN  && pass == TEST_USR_PSWD {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError()  {
        //Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены неверные данные   пользователя", preferredStyle: .alert)
        //Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        //Добавляем кнопку на UIAlertController
        alter.addAction(action)
        //показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if checkAuth() {
            print("auth good")
        } else {
            print("auth error")
        }
    }
    
    
    
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
}

