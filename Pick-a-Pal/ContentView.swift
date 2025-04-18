//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Rifqi Rahman on 15/04/25.
//


import SwiftUI

struct ContentView: View {
    @State private var names: [String] =/Users/rifqirahman/Files/Academy/Mastery is about showing up/Training Swift/Pick-a-Pal/Pick-a-Pal.xcodeproj []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
                    .padding(.bottom)
                
            }
            
            List {
                ForEach (names, id: \.description) { name in
                    Text(name)
                }
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
//            .frame(maxHeight: 430)
            
            
            Text("Random Picked Name : ")
                .padding(.bottom, 1)
            
            Text(pickedName.isEmpty ? "🤔" : "🥳 \(pickedName) 🎉")
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            Spacer()
                        
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return (name == randomName)
                        }
                    }
                    
                    // JUGA BISA GINI 👇
                    //                if shouldRemovePickedName == true {
                    //                    names.removeAll { $0 == pickedName }
                    //                }
                    
                } else {
                    pickedName = " "
                }
            } label : {
                Text("Pick Random Name")
                    .padding(.vertical, 7)
                    .padding(.horizontal, 14)
            }
//            .padding(.vertical, 7)
//            .padding(.horizontal, 14)
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            
           
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
