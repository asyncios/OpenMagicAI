//
//  ImageEditViewController.swift
//  SampleApp
//
//  Created by admin on 18/03/23.
//

import UIKit
import OpenMagicAI

final class ImageEditViewController: UIViewController, Loadable {

    @IBOutlet private weak var imageTextField: UITextField!
    @IBOutlet private weak var masksCollectionView: UICollectionView!
    @IBOutlet private weak var promptTextField: UITextField!
    private var masks = ["mask1", "mask2", "mask3", "mask4", "mask5"]

    private var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColletionViewUi()
    }

    @IBAction func selectImageOnTouch(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    @IBAction func createImageEditOnTouch(_ sender: Any) {
        guard
            let image = image,
            let imageData = image.pngData(),
            let prompt = promptTextField.text,
            !prompt.isEmpty
        else {
            return
        }
        var mask: Data?
        if let indexPath = masksCollectionView.indexPathsForSelectedItems?.first {
            var maskImage = UIImage(named: masks[indexPath.row])
            maskImage = resizeImage(image: maskImage!, targetSize: image.size)
            mask = maskImage?.pngData()
        }
        showLoadingView()
        openMagicAI.images.createImageEdit(
            image: imageData,
            mask: mask,
            prompt: prompt
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
                if case .success(let value) = result,
                    let imageUrlString = value.data.first?.url {
                    let viewController = ImageItemViewController()
                    viewController.imageUrlString = imageUrlString
                    self?.present(viewController, animated: true)
                }
            }
            debugPrint(result)
        }
    }
}

private extension ImageEditViewController {
    func setupColletionViewUi() {
        masksCollectionView.register(
            UINib(nibName: ImageCollectionViewCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: ImageCollectionViewCell.identifier
        )
        masksCollectionView.dataSource = self
        masksCollectionView.delegate = self
        masksCollectionView.reloadData()
    }
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    func cropImageToSquare(image: UIImage) -> UIImage? {
        var imageHeight = image.size.height
        var imageWidth = image.size.width

        if imageHeight > imageWidth {
            imageHeight = imageWidth
        }
        else {
            imageWidth = imageHeight
        }

        let size = CGSize(width: imageWidth, height: imageHeight)

        let refWidth : CGFloat = CGFloat(image.cgImage!.width)
        let refHeight : CGFloat = CGFloat(image.cgImage!.height)

        let x = (refWidth - size.width) / 2
        let y = (refHeight - size.height) / 2

        let cropRect = CGRectMake(x, y, size.height, size.width)
        if let imageRef = image.cgImage!.cropping(to: cropRect) {
            return UIImage(cgImage: imageRef, scale: 0, orientation: image.imageOrientation)
        }

       return nil
    }
}

extension ImageEditViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        masks.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath
        ) as? ImageCollectionViewCell else {
            return .init()
        }
        cell.image = UIImage(named: masks[indexPath.row])
        return cell
    }
}

extension ImageEditViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}

extension ImageEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickerImage = info[.editedImage] as? UIImage,
              let croppedImage = cropImageToSquare(image: pickerImage)
        else {
            return
        }

        let imageName = UUID().uuidString

        if let jpegData = croppedImage.jpegData(compressionQuality: 0.2) {
            image = UIImage(data: jpegData)
        }
        imageTextField.placeholder = imageName
        dismiss(animated: true)
    }
}
