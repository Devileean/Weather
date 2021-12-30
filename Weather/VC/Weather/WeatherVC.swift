//
//  WeatherVC.swift
//  Weather
//
//  Created by Алексей Логинов on 20.12.2021.
//

import UIKit


class WeatherVC: UIViewController {

    @IBOutlet weak var weatherCollection: UICollectionView!

   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        


    }


}

    extension WeatherVC: UICollectionViewDelegate,UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 10
    }

    //MARK: Изменим метод представления ячейки. В нем получим верную ячейку из пула, использовав идентификатор прототипа, и установим значения текстовых надписей.
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
    
        // Configure the cell
        cell.weather.text = "30 C"
        cell.time.text = "30.08.2017 18:00"
    
        return cell
    }
}


