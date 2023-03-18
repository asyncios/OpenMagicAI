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

    private var image: Data?
    
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
            let prompt = promptTextField.text,
            !prompt.isEmpty
        else {
            return
        }
        var mask: Data?
        if let indexPath = masksCollectionView.indexPathsForSelectedItems?.first {
            let image = UIImage(named: masks[indexPath.row])
            mask = image?.pngData()
        }
        showLoadingView()
        openMagicAI.images.createImageEdit(
            image: image,
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
        guard let pickerImage = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString

        if let jpegData = pickerImage.jpegData(compressionQuality: 0.8) {
            image = jpegData
        }
        imageTextField.placeholder = imageName
        dismiss(animated: true)
    }
}
