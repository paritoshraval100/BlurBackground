//
//  BlankView.swift
//  BlurBackground
//
//  Created by Paritosh Raval on 08/04/21.
//

import SwiftUI

// MARK: - COMPUTED PROPERTY

var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.orange, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

struct BlankView: View {

    // MARK: - PROPERTIES

    var backgroundColor: Color
    var backgroundOpacity: Double

    // MARK: - BODY

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0 , maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
    }
}


// MARK: - PREVIEW

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea(.all))
    }
}
