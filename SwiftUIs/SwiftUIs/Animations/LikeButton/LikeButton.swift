//
//  LikeButton.swift
//  SwiftUI-Animation
//
//  Created by Serafín Ennes Moscoso on 15/04/2021.
//

import SwiftUI

struct LikeButton: View {
    @State private var isLiked = false
    @State private var likes = "3"
    @State private var likesOffset: CGFloat = 0.0
    @State private var likesOpacity = 1.0

    var body: some View {

        HStack {
            ZStack() {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaleEffect(0.7)
                    .foregroundColor(.clearGray)

                Image(systemName: "heart.fill")
                    .resizable()
                    .scaleEffect(isLiked ? 1.0 : 0.0)
                    .foregroundColor(.darkPink)
                    .animation(.spring(response: isLiked ? 0.5 : 0.2,
                                       dampingFraction: isLiked ? 0.5 : 1))
            }
            .onTapGesture {
                isLiked.toggle()
                incrementLikes()
            }

            Spacer()

            Text(likes)
                .font(.system(size: 50, weight: .light))
                .foregroundColor(.clearGray)
                .opacity(likesOpacity)
                .offset(x: 0, y: likesOffset)
//                .transition(.move(edge: isLiked ? .bottom : .top))
                .padding()
        }
    }

    func incrementLikes() {
        likes = isLiked ? "4" : "3"

        
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false) { timer in
                withAnimation(.linear(duration: 0.1)) {
                    likesOffset = isLiked ? -40 : 40.0
                    likesOpacity = 0.0
                }
            }
        
        Timer.scheduledTimer(withTimeInterval: 0.16, repeats: false) { _ in
            likesOffset = isLiked ? 80 : -80
            
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { _ in
            withAnimation(.linear) {
                
                likesOffset =  0.0
                likesOpacity = 1.0
            }
            
        }

        
//        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { timer in
////            withAnimation(.linear(duration: 0.1)) {
//                likesOffset =  0.0
//                likesOpacity = 1.0
////            }
//        }
//        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
//            likesOffset = 0.0
//            likesOpacity = 1.0
//        }
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.darkGray.edgesIgnoringSafeArea(.all)

            LikeButton()
                .frame(width: 180, height: 100)
        }
    }
}
