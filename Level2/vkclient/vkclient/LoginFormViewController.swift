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
    
    // action для gestureRecognizer для закрытия keybord
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func viewWillAppear ( _ animated : Bool ) {
        super .viewWillAppear ( animated )
        // Подписываемся на два уведомления, одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver( self , selector : #selector(self.keyboardWasShown), name:
            NSNotification.Name.UIKeyboardWillShow, object: nil)
        // Второе когда она пропадает
        NotificationCenter.default.addObserver( self , selector :
            #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide,
                                                                 object: nil)
    }
    
    override func viewWillDisappear ( _ animated : Bool ) {
        super.viewWillDisappear ( animated)
        
        // убираем подписку на уведомления
        NotificationCenter . default . removeObserver ( self , name : NSNotification . Name . UIKeyboardWillShow ,
                                                        object : nil)
        NotificationCenter.default.removeObserver( self, name: NSNotification.Name.UIKeyboardWillHide,
                                                   object : nil)
    }
    
    // когда клавиатура появляется - к view добавляем отступ по размеру клавы
    @objc func keyboardWasShown ( notification : Notification ) {
        // получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = ( info.value ( forKey : UIKeyboardFrameEndUserInfoKey ) as! NSValue ).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake ( 0.0 , 0.0 , kbSize.height , 0.0)
        // добавляем отступ внизу UIScrollView равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //когда клавиатура исчезает - убираем отспут по размеру клавы
    @objc func keyboardWillBeHidden ( notification : Notification ) {
        // устанавливаем отступ внизу UIScrollView равный 0
        let contentInsets = UIEdgeInsets . zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    
    // Вызывается при segue для контроля аутентифицированного перехода на другую форму
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard checkAuth() else { // аутентификация не прошла - показваем ошибку
            showLoginError();
            return false
        }  
        return true
    }

    // Проверка корректности логина/пароля
    func checkAuth() -> Bool {
        let login = loginTextField.text!
        let pass = passwordTextField.text!
        if login == TEST_USR_LOGIN  && pass == TEST_USR_PSWD {
            return true
        } else {
            return false
        }
    }
    
    // Показать popap с ошибкой аутентификации
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
    
    // Нажали на кнопку "login"
    @IBAction func loginPressed(_ sender: Any) {
        if checkAuth() {
            print("auth good")
        } else {
            print("auth error")
        }
    }
    
    
    
    
  
    
}

