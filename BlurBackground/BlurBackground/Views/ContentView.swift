//
//  ContentView.swift
//  BlurBackground
//
//  Created by Paritosh Raval on 08/04/21.
//

import SwiftUI

struct ContentView: View {

    // MARK: - PROPERTIES
    @State private var showBlurEffect: Bool = false

    // MARK: - BODY

    var body: some View {

        NavigationView {
            ZStack {
                VStack(){
                    // This VStack contains number of views which should be blured. Below added views are just for example. You can put any view as per your need.
                    //****************************************************************************************
                    // Title
                    Text("Blur Animation")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.heavy)
                        .padding(.leading, 4)
                    Spacer(minLength: 80)

                    // List
                    List {
                        Text("List Number 1")
                        Text("List Number 2")
                        Text("List Number 3")
                    }

                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)

                    // Blur Effect button
                    Button(action: {
                        showBlurEffect = true
                    }, label: {
                        Image(systemName: "drop.fill")
                            .font(.system(size: 30, weight: .semibold , design: .rounded))
                        Text("Blur Effect")
                            .font(.system(size: 24, weight: .bold , design: .rounded))
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(Capsule())
                    )
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0, y: 4)
                    //****************************************************************************************

                } //: VSTACK
                
                .blur(radius: showBlurEffect ? 8 : 0, opaque: false)
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.5))

                // BLANK VIEW - Add a blank view to show blurr effect
                if showBlurEffect {
                    BlankView(
                        backgroundColor:
                            Color.black,
                        backgroundOpacity: 0.3
                    )
                    .onTapGesture {
                        withAnimation() {
                            showBlurEffect = false
                        }
                    }
                }

            } //: ZSTACK
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarHidden(true)
            .background(
                // Show background image view according to blur condition
                BackgroundImageView()
                    .blur(radius: showBlurEffect ? 8 : 0, opaque: false)
            )
            .background(
                backgroundGradient.ignoresSafeArea(.all)
        )
        } //: NAVIGATION VIEW
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
