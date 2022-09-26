//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 15/2/21.
//

import SwiftUI

struct ShoppingItemDetail: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var selectedShoppingItem:shoppingItems
   
    @EnvironmentObject var model:ZeusModel
    
    var body: some View {
        ZStack {
            Color("bubble-secondary")
            ScrollView  {
                //            Product Image
                Image(selectedShoppingItem.image1 ?? "")
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                
                DescriptionView(selectedShoppingItem: selectedShoppingItem)
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("$  \(String(selectedShoppingItem.price ?? 0))")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Button {
                    // TODO: add to cart button. Fix number of items
                    
                    model.addProductToCart(product: selectedShoppingItem)
                    
                 //   model.orders.append(cartItems(id: selectedShoppingItem.id, title: selectedShoppingItem.title, numberOfItems: 1, price: selectedShoppingItem.price, image: selectedShoppingItem.image1))
                    
                } label: {
                    Text("Add to Cart")
                        .font(Font.title2)
                        .foregroundColor(Color("text-primary"))
                        .padding()
                        .padding(.horizontal, 8)
                        .background(Color.white)
                        .cornerRadius(10.0)
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color("bubble-primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
