//
//  DelegatePracticeVC.swift
//  29thSeminar3
//
//  Created by taehy.k on 2021/10/23.
//

import UIKit

class DelegatePracticeVC: UIViewController {
    
    // MARK: - UI Components
    @IBOutlet weak var textField: UITextField!    
    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var partPickerView: UIPickerView!
    
    // MARK: - Properties
    var partList: [PartData] = []
    
    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        initPartData()
    }
    
    // MARK: - Helpers
    func setupDelegate() {
        textField.delegate = self
        partPickerView.dataSource = self
        partPickerView.delegate = self
    }
    
    func initPartData(){
        partList.append(contentsOf: [
            PartData(imageName: "wesoptiOSPart", partName: "iOS"),
            PartData(imageName: "wesoptAndroidPart", partName: "Android"),
            PartData(imageName: "wesoptWebPart", partName: "Web"),
            PartData(imageName: "wesoptServerPart", partName: "Server"),
            PartData(imageName: "wesoptDesignPart", partName: "Design"),
            PartData(imageName: "wesoptPlanPart", partName: "Plan")
        ])
    }
}

// MARK: - TextField Delegate
extension DelegatePracticeVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        makeAlert(title: "textFieldShouldReturn",
                  message: "끝!")
        textField.endEditing(true)
        return true
    }
}

// 데이터를 제어하는 기능
extension DelegatePracticeVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 컴포넌트 숫자 (열, column을 의미)
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 각 열에 따른 행의 개수
        partList.count
    }
}

// 사용자 동작을 처리하는 기능
extension DelegatePracticeVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // PickerView의 각 행의 title을 지정해주는 메서드
        partList[row].partName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        partImageView.image = partList[row].makeImage()
        textField.text = partList[row].partName
        
//        DispatchQueue.global(qos: .background).async {
//            DispatchQueue.main.async { [weak self] in
//                self?.partImageView.image = self?.partList[row].makeImage()
//                self?.textField.text = self?.partList[row].partName
//            }
//        }
    }
}

// MARK: - Alert
extension DelegatePracticeVC {
    private func makeAlert(title: String,
                           message: String) {
        let alertVC = UIAlertController(title: title,
                                        message: message,
                                        preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인",
                                     style: .default,
                                     handler: nil)
        
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
}
