//
//  ViewController.swift
//  fire
//
//  Created by 서이진 on 2021/07/20.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseFirestore
import FirebaseGoogleAuthUI

var currentUID = ""

class ViewController: UIViewController, FUIAuthDelegate, UIGestureRecognizerDelegate {

    var handle:AuthStateDidChangeListenerHandle! //handle
    let authUI = FUIAuth.defaultAuthUI() // authUI
    let db = Firestore.firestore() //db
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //SwipeGesture!
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestured(_:)))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        authUI!.delegate = self
    } //viewDidLoad
    
    // viewDidDisappear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //firebase auth listener 삭제
        Auth.auth().removeStateDidChangeListener(handle)
    } // viewDidDisappear
    
    // swipe
    @objc func swipeGestured(_ sender: Any) {
        handle = Auth.auth().addStateDidChangeListener{ (auth, user) in
            // 만약 로그인 했다면
            if let currentUser = auth.currentUser {
                // currentUser 정보 넘겨주기
                // 로그인한 유저 -> 기존 사용자 체크, 다음 뷰로 넘어감
                let ad = UIApplication.shared.delegate as? AppDelegate
                // appDelegate에 저장
                ad?.currentUID = currentUser.uid
                currentUID = currentUser.uid
                let docRef = self.db.collection("Users").document("\(currentUser.uid)")
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        
                    } else {
                        print("User does not exist")
                        self.db.collection("Users").document("\(currentUser.uid)").setData(["userMemoList" : [], "userID" : "\(currentUser.uid)", "userImage":"https://i.imgur.com/DggmR0m.png", "userName" : "\(currentUser.displayName!)"])
                        print("UserDataSaved!")
                    }
                }
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FirstView")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else {
                // 로그인 x
                self.authUI!.delegate = self
                let providers: [FUIAuthProvider] = [
                    FUIGoogleAuth()
                ]
                self.authUI!.providers = providers
                let authViewController = self.authUI!.authViewController()
                authViewController.modalPresentationStyle = .fullScreen
                authViewController.setNavigationBarHidden(true, animated: false)
                self.present(authViewController, animated: true, completion: nil)
            } // if else
        } // handle
    } // swipe

/*
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let currentUser = auth.currentUser {
                // 로그인 된 상태, currentUser 정보 넘겨주기
                // 로그인한 유저 -> 기존 사용자 체크, 다음 뷰로 넘어감
                let ad = UIApplication.shared.delegate as? AppDelegate
                // appDelegate에 저장
                ad?.currentUID = currentUser.uid
                currentUID = currentUser.uid
                
                if let displayName = currentUser.displayName{
                    let alertController = UIAlertController(title: "Media Pie", message: "\(displayName)! welcome! ", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: false, completion: nil)
                }
            } else {
                //로그아웃 된 상태
                let providers: [FUIAuthProvider] = [
                //  FUIEmailAuth()
                    FUIGoogleAuth()
                 
                ]
                self.authUI!.providers = providers
                let authVC = self.authUI!.authViewController()
                authVC.modalPresentationStyle = .fullScreen
                self.present(authVC, animated:false,completion:  nil)
            }
    }
    
    }*/

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    
    @IBAction func doSignOut(_ sender: UIButton) {
        guard let currentUser = Auth.auth().currentUser else{
            return
        }
        do {
       try authUI?.signOut()
    } catch {
        print("로그아웃 에러")
    }
    }
    
}

