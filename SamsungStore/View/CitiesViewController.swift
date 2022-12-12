//
//  CitiesViewController.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 12.12.2022.
//

import UIKit

final class CitiesViewController: UITableViewController {
    
    // MARK: - Onput - to say to world
    
    var onCitySelected: ((City) -> Void)?
    
    // MARK: - Private variables
    
    private let cities: [City] = [City(name: "Aginskoe"),
                                  City(name: "Chita"),
                                  City(name: "Ulan-Ude"),
                                  City(name: "Irkutsk"),
                                  City(name: "Novosibirsk")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.backgroundColor = .white
    }
    
    // MARK: - Table -
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = cities[indexPath.row].name
        cell.contentConfiguration = contentConfig
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        onCitySelected?(cities[indexPath.row])
    }
    
}

