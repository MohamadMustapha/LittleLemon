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
    
    @State var startersEnabled = false
    @State var mainsEnabled = false
    @State var dessertsEnabled = false
    @State var drinksEnabled = false

    var body: some View {
        NavigationView{
            VStack{
                Header()
                
                VStack(spacing: 0){
                    Hero()
                    SearchBar()
                }
                .background(Color.primaryColor1)
                
                Categories()

                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptors()
                )
                    { (dishes: [Dish]) in
                    List{
                        ForEach(dishes){dish in
                            NavigationLink(destination: Text("\(dish.title!) details \(dish.category!)")){
                                FoodItem(dish: dish)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
        .onAppear(){
            MenuList.getMenuData(viewContext: viewContext)
        }

    }
    
    func Categories() -> some View{
        VStack{
            Text("ORDER FOR DELIVERY")
                .sectionsTextStyle()
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20 ){
                    Toggle("Starters", isOn: $startersEnabled)
                    Toggle("Mains", isOn: $mainsEnabled)
                    Toggle("Desserts", isOn: $dessertsEnabled)
                    Toggle("Drinks", isOn: $drinksEnabled)
                }
                .toggleStyle(MyToggleStyle())
            }
            Divider()
        }
        .padding(.leading)
    }
    
    func SearchBar() -> some View {
        TextField("Search for a Dish", text: $searchText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.system(size: 20, weight: .heavy, design: .default))
            .padding()
    }

    func buildSortDescriptors() -> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate{
        
        let search = searchText.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS [cd] %@",searchText)
        let starters = startersEnabled ? NSPredicate(format: "category == %@", "starters") : NSPredicate(value: true)
        let mains = mainsEnabled ? NSPredicate(format: "category == %@", "mains") : NSPredicate(value: true)
        let desserts = dessertsEnabled ? NSPredicate(format: "category == %@", "desserts") : NSPredicate(value: true)
        let drinks = drinksEnabled ? NSPredicate(format: "category == %@", "drinks") : NSPredicate(value: true)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        
        return compoundPredicate

    }
  
}
#Preview {
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
