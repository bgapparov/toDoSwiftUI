//
//  ContentView.swift
//  ToDo
//
//  Created by Baiaman Gapparov on 7/26/20.
//  Copyright © 2020 Baiaman Gapparov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContex
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView{
            List{
                //MARK: - FirstSection
                Section(header: Text("What is next?")){
                    HStack{
                        TextField("New item", text: self.$newToDoItem)
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContex)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContex.save()
                            }catch{
                                print(error)
                            }
                            
                            self.newToDoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                
                //MARK: - SecondSection
                Section(header: Text("To Do's")){
                   ForEach(self.toDoItems) { todoItem in
                    ToDOItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                   }.onDelete{ indexSet in
                    let deleteItem = self.toDoItems[indexSet.first!]
                    self.managedObjectContex.delete(deleteItem)
                    
                    do {
                        try self.managedObjectContex.save()
                    }catch{
                        print(error)
                    }
                    
                    }
            }
            }.navigationBarTitle("My list")
                .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
