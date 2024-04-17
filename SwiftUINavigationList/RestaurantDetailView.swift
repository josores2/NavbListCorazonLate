//
//  RestaurantDetailView.swift
//  SwiftUINavigationList
//
//  Created by Jose on 11/4/24.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    var restaurant: Restaurant
    @Environment(\.presentationMode) var mode
    @State private var scale: CGFloat = 1.0

    
    var body: some View {
    VStack {
           Image(restaurant.image)
               .resizable()
               .aspectRatio(contentMode: .fit)
           Text(restaurant.name)
               .font(.system(.title, design: .rounded))
               .fontWeight(.black)
               
       Spacer()
    }
    .navigationBarBackButtonHidden(true)
        
    .navigationBarItems(
                leading: Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Text("\(Image(systemName: "heart.fill")) \(restaurant.name)")
                        .foregroundColor(.red)
                        .scaleEffect(scale) // Aplica la escala dinámica
                }
            )
            .onAppear {
                // Configura un timer para cambiar la escala continuamente
                let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    withAnimation {
                        self.scale = self.scale == 1.0 ? 0.5 : 1.0 // Alterna entre 1.0 y 0.5
                    }
                }
                timer.fire() // Dispara el timer inmediatamente
            }
}

  //  .scaleEffect(true ? 1.0 : 0.5)

}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Waffle & Wolf", image: "wafflewolf"))
    }
}
