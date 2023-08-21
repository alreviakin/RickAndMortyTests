//
//  PersonViewController.swift
//  RickAndMortyTests
//
//  Created by Алексей Ревякин on 20.08.2023.
//

import UIKit

protocol PersonViewControllerDelegate: AnyObject {
    func relodeData()
}

class PersonViewController: UIViewController {
    var viewModel: PersonViewModel? {
        didSet {
            guard let viewModel else { return }
            personView.update(character: viewModel.getCharacter())
        }
    }
    private var personView = PersonView()
    
    override func loadView() {
        super.loadView()
        view = personView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        personView.delegate = self
        personView.configure()
        configure()
    }
    
    private func configure() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension PersonViewController: PersonViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? EpoisodeTableViewCell,
              let cellViewModel = viewModel?.getEpisodeCellViewModel(for: indexPath) else { return UITableViewCell() }
        cell.backgroundColor = .clear
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func getHeightTable() -> CGFloat {
        return CGFloat((102 * (viewModel?.numberOfRows() ?? 0)))
    }
    
    func back() {
        dismiss(animated: true)
    }
}

extension PersonViewController: PersonViewControllerDelegate {
    func relodeData() {
        personView.reloadData()
    }
}
