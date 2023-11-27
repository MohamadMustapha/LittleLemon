//
//  MenuList.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 13/11/2023.
//

import Foundation
import CoreData

struct MenuList: Decodable {
    let menu: [MenuItem]
    
    static func getMenuData(viewContext: NSManagedObjectContext){
        
        PersistenceController.shared.clear()
        
        let serverAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: serverAddress)
        let urlRequest = URLRequest(url: url!)
        let urlSession = URLSession.shared.dataTask(with: urlRequest){
            data, response, error in
            if let data = data{
                let decoder = JSONDecoder()
                let menuList = try? decoder.decode(MenuList.self, from: data)
                for dish in menuList!.menu{
                    let newDish = Dish(context: viewContext)
                    newDish.title = dish.title
                    newDish.price = dish.price
                    newDish.desc = dish.description
                    newDish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/pasta.jpg?raw=true"
                    newDish.category = dish.category
                }
                try? viewContext.save()

            }
        }
        urlSession.resume()
        
    }
}

