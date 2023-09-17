//
//  DetailView.swift
//  ToDoList
//
//  Created by apple on 17.09.2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundColor(.orange)
            
            Text("You Are a Swifty Legend")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(.orange)
            
            Spacer()
            
            Button("Get Beck!") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
