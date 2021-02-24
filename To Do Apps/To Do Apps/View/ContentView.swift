//
//  ContentView.swift
//  To Do Apps
//
//  Created by Reefkey on 16/02/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State private var name : String = ""
    @FetchRequest( entity: Todo.entity(),sortDescriptors: [NSSortDescriptor(keyPath:\Todo.name, ascending: true)] ) var todos: FetchedResults<Todo>
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        NavigationView {
            ZStack{
            VStack {
                HStack {
                    TextField("Enter in a new task", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .font(.system(size: 20,weight:.bold,design:.default))
                    
                    Button(action: {
                        if self.name != ""{
                            let todo = Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            
                            do {
                                try self.managedObjectContext.save()
                                print("New todo: \(todo.name ?? "")")
                            } catch {
                                print(error)
                            }
                            
                        }
                    }) {
                        Image(systemName: "plus")
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .font(.system(size: 20,weight:.bold,design:.default))
                    }
                            
                        
                    
                }//HStack
                .padding()
                List {
                    ForEach(self.todos, id: \.self) { todo in
                        Text(todo.name ?? "Unknown")
                    }.onMove(perform: self.move)
                    .onDelete(perform: deleteTodo)
                }
                .padding(0.0)
                .navigationBarTitle("Tasks",displayMode: .inline)
                
                .navigationBarItems(trailing: EditButton()
                )
            }//: Vstack
                //emptylistView
                if todos.count == 0 {
                    EmptyListView()
                }
            }//: ZStack
        }
    }
    func move(from source : IndexSet, to destination : Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    private func deleteTodo(at offsets: IndexSet) {
            for index in offsets {
                let todo = todos[index]
                managedObjectContext.delete(todo)
                
                do {
                    try managedObjectContext.save()
                    
                } catch {
                    print(error)
                }
            }
        }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                return ContentView()
                    .environment(\.managedObjectContext, context)
                    .previewDevice("iphone 11 pro")
    }
}
