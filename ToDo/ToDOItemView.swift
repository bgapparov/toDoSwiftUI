//
//  ToDOItemView.swift
//  ToDo
//
//  Created by Baiaman Gapparov on 7/26/20.
//  Copyright © 2020 Baiaman Gapparov. All rights reserved.
//

import SwiftUI

struct ToDOItemView: View {
    var title: String = ""
    var createdAt:String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct ToDOItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDOItemView()
    }
}
