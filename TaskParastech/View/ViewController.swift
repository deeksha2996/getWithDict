//
//  ViewController.swift
//  TaskParastech
//
//  Created by Deeksha Sharma on 07/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = UserViewModel()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getAllUserData { [weak self] status in
            if status {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
        // Do any additional setup after loading the view.
    }

    

}
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getUserData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)as!CollectionViewCell
        let dataArr = viewModel.getUserData()
        cell.lblUserLocation.text = "\(dataArr[indexPath.row].user?.location?.state ?? ""), \(dataArr[indexPath.row].user?.location?.city ?? "")"
        
        if let url = URL(string:dataArr[indexPath.row].user?.picture ?? "") {
        let data = try? Data(contentsOf: url)

        if let imageData = data {
            let image = UIImage(data: imageData)
            cell.imgUserProfilePic.image = image
        }
            cell.imgUserProfilePic.layer.borderWidth = 1
            cell.imgUserProfilePic.layer.masksToBounds = false
            cell.imgUserProfilePic.layer.borderColor = UIColor.black.cgColor
            cell.imgUserProfilePic.layer.cornerRadius = cell.imgUserProfilePic.frame.height/2
            cell.imgUserProfilePic.clipsToBounds = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
   
    }
    
    

extension UIImage {

    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

}

//extension UIImageView {
//
//    func makeRounded() {
//
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = false
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.cornerRadius = self.frame.height / 2
//        self.clipsToBounds = true
//    }
//}

