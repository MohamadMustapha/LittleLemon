//
//  Menu.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 11/11/2023.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    var body: some View {
        NavigationView{
            VStack{
                Text("Little Lemon")
                Text("Chicago")
                Text("We are a food delivery app in Chicago called Little Lemon")
                TextField("Search for a dish", text: $searchText)
                    .padding()
                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptors()
                )
                    { (dishes: [Dish]) in
                    List{
                        ForEach(dishes){dish in
                            NavigationLink(destination: Text("\(dish.title!) details")){
                                FoodItem(dish: dish)
                            }
                        }
                    }
                }
            }
        }.onAppear(){
            getMenuData(viewContext: viewContext)
        }

    }
    func getMenuData(viewContext: NSManagedObjectContext){
        
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
                }
                try? viewContext.save()

            }
        }
        urlSession.resume()
        
    }
    func buildSortDescriptors() -> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    func buildPredicate() -> NSPredicate{
        if searchText.isEmpty{
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "title CONTAINS [cd] %@",searchText)
    }
  
}
#Preview {
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
