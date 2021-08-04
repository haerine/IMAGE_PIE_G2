//
//  FirstView.swift
//  fire
//
//  Created by 이혜린 on 2021/08/04.
//

import UIKit

class FirstView : UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let vc = UIStoryboard(name: "FirstView", bundle: nil).instantiateViewController(identifier: "FirstView")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
