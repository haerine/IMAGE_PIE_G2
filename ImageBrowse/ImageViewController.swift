//
//  ImageViewController.swift
//  guru2
//
//  Created by 이혜린 on 2021/08/03.
//

import UIKit
import Alamofire
/*
class ImageViewController : UIViewController {
    
    var search_data = [Response]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        print("start loading")
        let headers: HTTPHeaders = [
            "Authorization" : "KakaoAK 128ddd06edd689c9407b0b7db93181fa"
        ]
        let parameters = ["query": "설현"]
        AF.request("https://dapi.kakao.com/v2/search/image", parameters: parameters, headers: headers).responseJSON { response in
            //debugPrint(response)
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let decoder = JSONDecoder()
                    let meta_data = try decoder.decode(Response.self, from: jsonData)
                    
                   // self.search_data = meta_data.meta

                    //self.search_data = dummy_data.data
                    //self.searchCollectionView.reloadData()
                    print(meta_data)
                    //print(document_data)
                    print("finish parsing")
                } catch {
                    debugPrint(error)
                }
            case .failure(let data):
                print("fail")
            default:
                return
            }
        }
        print("finish loading")
    }
}
*/
