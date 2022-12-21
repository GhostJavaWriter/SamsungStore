//
//  CitiesViewController.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 21.12.2022.
//

import UIKit

protocol CityOutput {
    var onCitySelected: ((City) -> Void)? { get set }
}

final class CitiesViewController: UITableViewController, CityOutput {
    
    var viewModel: CitiesViewModel
    
    // MARK: - Output
    
    var onCitySelected: ((City) -> Void)?
    
    // MARK: - Init
    
    init(viewModel: CitiesViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCities()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        
        let city = viewModel.cityForRowAt(indexPath: indexPath)
        config.text = city.name
        cell.contentConfiguration = config
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = viewModel.cityForRowAt(indexPath: indexPath)
        onCitySelected?(city)
    }
}
