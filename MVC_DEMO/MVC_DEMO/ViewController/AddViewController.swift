//
//  AddViewController.swift
//  MVC_DEMO
//
//  Created by FETC_iMac2 on 2022/5/16.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func reloadTableView()
}

class AddViewController: UIViewController {

    @IBOutlet weak var titletf: UITextField!
    @IBOutlet weak var contenttf: UITextField!

    weak var delegate: AddViewControllerDelegate?
    var modelManager: ModelManager? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func clickSave(_ sender: Any) {

        if titletf.text!.isEmpty || contenttf.text!.isEmpty {
            showAlert(title: "請輸入標題/內文")
            return
        }

        let model = Model(title: titletf.text!, detail: Model.Detail(detailText: contenttf.text!))

        modelManager?.model.append(model)
        delegate?.reloadTableView()
        navigationController?.popViewController(animated: true)
    }

    func showAlert(title: String){

        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

}
