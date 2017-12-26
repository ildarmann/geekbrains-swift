//
//  ViewController.swift
//  weather
//
//  Created by Гюзель Маннанова on 21.12.2017.
//  Copyright © 2017 mif. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let MY_LOGIN = "user"
    let MY_PASSOWRD = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer ( target : self , action :
            #selector(self.hideKeyboard))
        // присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer ( hideKeyboardGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear ( _ animated : Bool ) {
        super . viewWillAppear ( animated )
        // Подписываемся на два уведомления, одно приходит при появлении клавиатуры
        NotificationCenter . default . addObserver ( self , selector : #selector(self.keyboardWasShown), name:
            NSNotification.Name.UIKeyboardWillShow, object: nil)
        // Второе когда она пропадает
        NotificationCenter . default . addObserver ( self , selector :
            #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide,
                                                                 object: nil)
    }
    
    // когда клавиатура появляется
    @objc func keyboardWasShown ( notification : Notification ) {
        // получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = ( info.value ( forKey : UIKeyboardFrameEndUserInfoKey ) as! NSValue ).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake ( 0.0 , 0.0 , kbSize.height , 0.0)
        // добавляем отступ внизу UIScrollView равный размеру клавиатуры
        self . scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    override func viewWillDisappear ( _ animated : Bool ) {
        super . viewWillDisappear ( animated)
        NotificationCenter . default . removeObserver ( self , name : NSNotification . Name . UIKeyboardWillShow ,
                                                        object : nil)
        NotificationCenter.default.removeObserver( self, name: NSNotification.Name.UIKeyboardWillHide,
            object : nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let authChecked = checkAuth(loginTextField.text!, passwordTextField.text!)
        if  !authChecked {
            showError()
        }
        
        return authChecked
    }
    
    func checkAuth(_ login:String, _ password: String) -> Bool {
        if login == MY_LOGIN && password == MY_PASSOWRD {
            return true
        }else {
            return false
        }
    }
    
    func showError() {
        //Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        //Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        //Добавляем кнопку на UIAlertController
        alter.addAction(action)
        //показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
    
    //когда клавиатура исчезает
    @objc func keyboardWillBeHidden ( notification : Notification ) {
        // устанавливаем отступ внизу UIScrollView равный 0
        let contentInsets = UIEdgeInsets . zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //При тапе на пустом месте - клавиатура исчезает
    @objc func hideKeyboard () {
        self . scrollView?.endEditing ( true)
    }
    
    

    @IBAction func doLogin(_ sender: Any) {
        if checkAuth(loginTextField.text!, passwordTextField.text!) {
            print("успешная авторизация: \(loginTextField.text!)")
        }else {
            print("неуспешная авторизация: \(loginTextField.text!)")
        }
        
    }
    
}

