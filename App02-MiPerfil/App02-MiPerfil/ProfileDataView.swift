//
//  ProfileDataView.swift
//  App02-MiPerfil
//
//  Created by Carlos Astengo Macias on 28/09/21.
//

import SwiftUI

struct ProfileDataView: View {
    
    @Binding var name: String
    @Binding var city: String
    @Binding var email: String
    @Binding var id: String
    @Binding var date: Date
    @Binding var backgroundColor: Color
    @Binding var titleColor: Color
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Form{
                    Section(header: Text("Datos Personales"), content: {                            TextField("Nombre", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Cuidad", text: $city)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Matricula", text: $id)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                            Text("Fecha de nacimiento")
                        }
                    })
                    
                    Section(header: Text("Personalizar Perfil"), content: {
                        ColorPicker("Color del Fondo", selection: $backgroundColor)
                        ColorPicker("Color Secundario", selection: $titleColor)
                    })
                }
            }.navigationTitle("Cambiar Datos")
        }
    }
}

struct ProfileDataView_Previews: PreviewProvider {
    
    @State static var name: String = "Carlos Astengo Macias"
    @State static var city: String = "Monterrey"
    @State static var email: String = "astengo.carlos@gmail.com"
    @State static var id: String = "A00189239"
    @State static var date: Date = Date()
    @State static var backgroundColor = Color("Background")
    @State static var titleColor = Color("Title")
    
    static var previews: some View {
        ProfileDataView(name: $name, city: $city, email: $email, id: $id, date: $date, backgroundColor: $backgroundColor, titleColor: $titleColor)
            .preferredColorScheme(.light)
        
    }
}
