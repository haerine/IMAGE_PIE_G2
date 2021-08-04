//
//  PickerView.swift
//  MediaPie
//
//  Created by 이혜린 on 2021/08/04.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let whatContents = ["Video", "Book", "Music", "etc"] //pickerView component1
    var Contents = [String]() //pickerview component 2
    let video = ["NETFLIX", "WATCHA", "Wavve"]
    let book = ["밀리의 서재", "리디 셀렉트"]
    let music = ["Melon", "Genie Music", "Bugs", "Apple Music"]
    let etc = ["Youtube Premium"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return whatContents.count
        } else {
            return Contents.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return whatContents[row]
        } else {
            return Contents[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && row == 0 {
            Contents = video
        } else if component == 0 && row == 1 {
            Contents = book
        } else if component == 0 && row == 2 {
            Contents = music
        } else if component == 0 && row == 3 {
            Contents = etc
        }
        pickerView.reloadAllComponents()
    }
}
