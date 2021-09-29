//
//  TextView.swift
//  App01-MiPerfil
//
//  Created by Carlos Astengo Macias on 28/09/21.
//

import SwiftUI

struct TextView: View {
    
    var text: String
    var image: String
    var font: String
    var size: CGFloat
    
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
                .font(.Gluten(style: font, size: size))
                .padding()
            Spacer()
        }
        .padding(.leading,40)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "Carlos", image: "person.fill", font: "Gluten-Regular.ttf", size: 20)
    }
}
