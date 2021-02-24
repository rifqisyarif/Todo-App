//
//  EmptyListView.swift
//  To Do Apps
//
//  Created by Reefkey on 23/02/21.
//

import SwiftUI

struct EmptyListView: View {
    
    //MARK PROPERTIES
    
    let image: [String] = [
    "question",
    ]
    
    let tips: [String] = [
        "Always positive thinking",
        "Whoever is focus will be success",
        "Use your time wisely",
        "Make your target and intension"
    ]
    var body: some View {
        ZStack{
            VStack{
                Image("\(image.randomElement() ?? self.image[0])")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 200, idealWidth: 200, maxWidth: 200, minHeight: 200, idealHeight: 200, maxHeight: 200, alignment: .center)
                    .layoutPriority(1)
                
                Text("\(tips.randomElement() ?? self.tips[0])")
                    .layoutPriority(0.5)
                    .font(.system(.headline,design:.rounded))
            }//: Vstack
        }//: Zstack
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}

