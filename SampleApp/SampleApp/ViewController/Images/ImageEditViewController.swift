//
//  ImageEditViewController.swift
//  SampleApp
//
//  Created by admin on 18/03/23.
//

import UIKit

final class ImageEditViewController: UIViewController {

    @IBOutlet private weak var masksCollectionView: UICollectionView!
    private var masks = ["mask1", "mask2", "mask3", "mask4", "mask5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColletionViewUi()
    }


}

private extension ImageEditViewController {
    func setupColletionViewUi() {
        masksCollectionView.register(UINib(nibName: ImageCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
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
