//
//  BackgroundImageView.swift
//  BlurBackground
//
//  Created by Paritosh Raval on 08/04/21.
//

import SwiftUI

struct BackgroundImageView: View {

    // MARK: - BODY

    var body: some View {
        Image("girl")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

// MARK: - PREVIEW

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
