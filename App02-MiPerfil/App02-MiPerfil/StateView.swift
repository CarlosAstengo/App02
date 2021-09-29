//
//  StateView.swift
//  App02-MiPerfil
//
//  Created by Carlos Astengo Macias on 28/09/21.
//

import SwiftUI

struct StateView: View {
    
    @State var counter: Int = 0
    @State var color: Bool = false
    @State var showView: Bool = false
    
    var body: some View {
        ZStack {
            color ? Color.blue : Color.purple
            VStack {
                Text("Counter: \(counter)")
                    .font(.Gluten(style: "Bold", size: 40))
                    .padding(.bottom,20)
                Button(action: {
                    counter += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                    
                })
                
                Button(action: {
                    counter += 10
                    color.toggle()
                }, label: {
                    Text("Background")
                        .font(.Gluten(style: "Bold", size: 40))
                        .foregroundColor(.white)
                        .padding()
                        .background(color ? Color.purple : Color.blue)
                        .cornerRadius(20)
                })
                    .padding(.top, 20)
                
                Button(action: {
                    showView.toggle()
                }, label: {
                    Text("Open")
                        .font(.Gluten(style: "Bold", size: 40))
                        .foregroundColor(.white)
                        .padding()
                        .background(color ? Color.purple : Color.blue)
                        .cornerRadius(20)
                })
                .padding(.top,20)
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showView, content: {
            DataView(counter: $counter, color: $color)
        })
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
