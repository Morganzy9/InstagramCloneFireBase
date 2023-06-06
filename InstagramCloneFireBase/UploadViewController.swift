//
//  UploadViewController.swift
//  InstagramCloneFireBase
//
//  Created by Ислам Пулатов on 5/30/23.
//

import UIKit
import Firebase
import FirebaseStorage


class UploadViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var postImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImageButton.isEnabled = false
        
        
        let gestureHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureHideKeyboard)
        
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        
    }

//        MARK: Posting and Saving
    
    @IBAction func postImageButtonTapped(_ sender: Any) {
        
        let storage = Storage.storage()
        
        let storageRef = storage.reference()
        
        let mediaFolder = storageRef.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageRef = mediaFolder.child("\(uuid).jpg")
            
            imageRef.putData(data) { (storageMetaData, error) in
                
                if error != nil {
                    
                    print(error?.localizedDescription ?? "LOL")
                    
                } else {
                    
                    imageRef.downloadURL { url, error in
                        
                        if error == nil {
                                
//                        MARK:  DATABASE
                            
                            let imageUrl = url?.absoluteString

                            
                            let firestoreDataBase = Firestore.firestore()
                            
//                            var firestoreRef : DocumentReference? = nil
                            
                            let firestorePost = [ "imageUrl" : imageUrl!,
                                                  "postBy" : Auth.auth().currentUser?.email as Any,
                                                  "postComment" : self.textField.text!,
                                                  "date" : FieldValue.serverTimestamp(),
                                                  "likes" : 0,
                            ] as [String : Any]
                            
                            var firestoreRef : DocumentReference? = firestoreDataBase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                
                                if error != nil {
                                    
                                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Unknown Error")
                                    
                                } else {
                                    
                                    self.imageView.image = UIImage(systemName: "square.and.arrow.up.on.square")
                                    self.textField.text = ""
                                    
                                    self.tabBarController?.selectedIndex = 0
                                    
                                }
                                
                                
                            })
                            
                            
                            
                            
                            
                        }
                        
                        
                    }
                    
                }
                
                
                
            }
            
        }
        
        
        
        
    }
    
    
    @objc func hideKeyboard() {
        
        view.endEditing(true)
        
    }
    
    
    @objc func selectImage() {
        
        let vc = UIImagePickerController()
        
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = false
        
        present(vc, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        
        postImageButton.isEnabled = true
        
        self.dismiss(animated: true)
        
    }
    
    func makeAlert(title : String, message : String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
        
    }

}
