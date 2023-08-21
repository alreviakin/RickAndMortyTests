//
//  CharactersViewController.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 17.08.2023.
//

import UIKit

protocol CharactersViewControllerDelegate: AnyObject {
    func reloadeDate()
}

class CharactersViewController: UIViewController {
    var viewModel: CharactersViewModel?
    private var mainView = CharactersView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        mainView.configure()
        configure()
        guard let viewModel else { return }
    }
    
    private func configure() {
        mainView.backgroundColor = UIColor(hexString: "#040C1E")
        title = "Characters"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,
                                                                        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 28, weight: .bold)]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension CharactersViewController: CharactersViewDelegate {
    
    //MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PersonViewController()
        vc.viewModel = viewModel?.getPersonViewModel(for: indexPath)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharacterCollectionViewCell, let cellViewModel = viewModel?.getCharacterCell(for: indexPath) else { return UICollectionViewCell() }
        cell.viewModel = cellViewModel
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (mainView.bounds.width - 16 - 47) / 2, height: 202)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 27)
    }
}

extension CharactersViewController: CharactersViewControllerDelegate {
    func reloadeDate() {
        mainView.reloadData()
    }
}
