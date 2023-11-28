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

    @State var isAscending = true
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
                            NavigationLink(destination: DetailItem(dish: dish)){
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
            HStack {
                Text("ORDER FOR DELIVERY")
                    .sectionsTextStyle()
                SortTool()
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15 ){
                    Toggle("Starters", isOn: $startersEnabled)
                    Toggle("Mains", isOn: $mainsEnabled)
                    Toggle("Desserts", isOn: $dessertsEnabled)
                    Toggle("Drinks", isOn: $drinksEnabled)
                }
                .toggleStyle(MyToggleStyle())
            }
            Divider()
        }
        .padding(.horizontal)
    }
    
    func SearchBar() -> some View {
        TextField("Search for a Dish", text: $searchText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.system(size: 20, weight: .heavy, design: .default))
            .padding()
    }
    func SortTool() -> some View {
        Button(action: {
            isAscending.toggle()
        }) {
            Image(systemName: isAscending ? "arrow.up" : "arrow.down")
        }
    }

    func buildSortDescriptors() -> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: isAscending)]
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
