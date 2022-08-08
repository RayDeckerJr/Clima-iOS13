//
//  WeatherManager.swift
//  Clima
//
//  Created by Ray Decker Jr on 8/8/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=e4f1b767d31500f0d103a19986f3ea9e&units=imperial"

    func fetchWeather(cityName: String){
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            task.resume()
        }
    }
    
    func handle(data:Data?, response: URLResponse?, error: Error?) -> Void{
        if error != nil{
            print(error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
