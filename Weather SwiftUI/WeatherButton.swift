//
//  WeatherButton.swift
//  Weather SwiftUI
//
//  Created by Tahir Saifi on 09/09/2024.
//

import Foundation
import SwiftUI

public struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    public var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
