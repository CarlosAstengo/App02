//
//  ContentView.swift
//  App01-MiPerfil
//
//  Created by Carlos Astengo Macias on 28/09/21.
//

import SwiftUI

struct ProfileView: View {
    
    @State var name: String = "Carlos Astengo Macias"
    @State var city: String = "Monterrey"
    @State var email: String = "astengo.carlos@gmail.com"
    @State var id: String = "A00189239"
    @State var date: Date = Date()
    @State var backgroundColor = Color("Background")
    @State var titleColor = Color("Title")
    
    @State var showView: Bool = false
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                Text("Mi Perfil")
                    .font(.Gluten(style: "Bold", size: 40))
                    .foregroundColor(titleColor)
                    .padding(.bottom,20)
                    .padding(.top,60)
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 10)
                            .foregroundColor(titleColor)
                    )
                    .padding(.vertical,60)
                
                TextView(text: name, image: "person.fill", font: "Black", size: 28)
                TextView(text: city, image: "house.fill", font: "Regular", size: 28)
                TextView(text: email, image: "envelope.fill", font: "Regular", size: 28)
                TextView(text: id, image: "qrcode", font: "Regular", size: 28)
                HStack {
                    Image(systemName: "calendar")
                    Text("\(dateFormat.string(from: date))")
                        .font(.Gluten(style: "Regular", size: 24))
                        .padding()
                    Spacer()
                }
                .padding(.leading,60)
                Button(action: {
                    showView.toggle()
                }, label: {
                    Text("Open")
                        .font(.Gluten(style: "Bold", size: 40))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(20)
                })
                .padding(.top,20)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showView, content: {
            ProfileDataView(name: $name, city: $city, email: $email, id: $id, date: $date, backgroundColor: $backgroundColor, titleColor: $titleColor)
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
