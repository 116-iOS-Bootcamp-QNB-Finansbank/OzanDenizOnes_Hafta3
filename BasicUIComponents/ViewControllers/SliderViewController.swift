//
//  SliderViewController.swift
//  BasicUIComponents
//
//  Created by Ozan Deniz Ones on 16.09.2021.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentIndex: Int = 0
    
    var images = [SliderImage(image: UIImage(named: "first.jpg")!, text: "First Image"),
                  SliderImage(image: UIImage(named: "second.jpg")!, text: "Second Image"),
                  SliderImage(image: UIImage(named: "third.jpg")!, text: "Third Image"),
                  SliderImage(image: UIImage(named: "fourth.jpg")!, text: "Fourth Image"),
                  SliderImage(image: UIImage(named: "fifth.jpg")!, text: "Fifth Image")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //The codes in the comments are the case when tap gesture is applied for infinite scroll. Without these codes, finite scroll works.
        
        /*
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImages))
        view.addGestureRecognizer(gestureRecognizer)
        view.isUserInteractionEnabled = true
         */
    }
    
    /*
    @objc func changeImages(){
        if currentIndex < images.count - 1 {
            currentIndex += 1
        }
        else {
            currentIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
     */
}

// MARK: - UICollectionViewDelegate
//extension SliderViewController: UICollectionViewDelegate {
    
//}

// MARK: - UICollectionViewDataSource
extension SliderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! SliderCollectionViewCell
        cell.imageView.image = images[indexPath.row].image
        cell.myLabel.text = String(images[indexPath.row].text)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SliderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
}
