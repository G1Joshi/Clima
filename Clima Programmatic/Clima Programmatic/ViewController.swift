//
//  ViewController.swift
//  Clima Programmatic
//
//  Created by Jeevan Chandra Joshi on 12/01/23.
//

import UIKit

class ViewController: UIViewController {
    let background = UIImageView()
    let stackView = UIStackView()
    let searchStackView = UIStackView()
    let locationButton = UIButton()
    let searchField = UITextField()
    let searchButton = UIButton()
    let iconImageView = UIImageView()
    let tempLabel = UILabel()
    let cityLabel = UILabel()
    let spacer = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        setupConstraint()
    }

    func setupUi() {
        view.addSubview(background)
        view.addSubview(stackView)

        background.image = UIImage(named: "Background")
        background.contentMode = .scaleAspectFill

        stackView.addArrangedSubview(searchStackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(tempLabel)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(spacer)

        searchStackView.addArrangedSubview(locationButton)
        searchStackView.addArrangedSubview(searchField)
        searchStackView.addArrangedSubview(searchButton)

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10

        searchStackView.axis = .horizontal
        searchStackView.alignment = .fill
        searchStackView.distribution = .fill
        searchStackView.spacing = 10

        locationButton.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.tintColor = .label

        searchField.placeholder = "Search"
        searchField.textAlignment = .center
        searchField.textColor = .label
        searchField.backgroundColor = .systemFill
        searchField.font = .systemFont(ofSize: 25)

        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .label

        iconImageView.image = UIImage(systemName: "sun.max")
        iconImageView.tintColor = .label

        tempLabel.text = "22°C"
        tempLabel.textColor = .label
        tempLabel.font = .boldSystemFont(ofSize: 100)

        cityLabel.text = "India"
        cityLabel.textColor = .label
        cityLabel.font = .systemFont(ofSize: 50)
    }

    func setupConstraint() {
        background.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            searchStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            searchStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            locationButton.heightAnchor.constraint(equalToConstant: 50),
            locationButton.widthAnchor.constraint(equalToConstant: 50),

            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.widthAnchor.constraint(equalToConstant: 50),

            iconImageView.heightAnchor.constraint(equalToConstant: 120),
            iconImageView.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}
