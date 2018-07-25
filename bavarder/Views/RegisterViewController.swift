//
//  RegisterViewController.swift
//  bavarder
//
//  Created by Irving Hsu on 5/25/18.
//  Copyright © 2018 Irving Hsu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var DisplayNameTextfield: UITextField!
    @IBOutlet weak var EmailTextfield: UITextField!
    @IBOutlet weak var PasswordTextfield: UITextField!
    
    var imagePicker = UIImagePickerController()
    let firebaseRegistration = FirebaseRegister()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        firebaseRegistration.checkPermission()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SelectPhotoButton(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func RegisterButton(_ sender: UIButton) {
        firebaseRegistration.registerUserWithEmail(email: self.EmailTextfield, password: self.PasswordTextfield, displayName: self.DisplayNameTextfield, profileImage: self.profileImage.image!) {
            self.performSegue(withIdentifier: "registrationCompleteSegue", sender: self)
        }
    }
    @IBAction func BackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }


}
