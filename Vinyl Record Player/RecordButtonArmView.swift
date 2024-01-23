//
//  RecordButtonArmView.swift
//  Vinyl Record Player
//
//  Created by Vladimir Vinakheras on 20.01.2024.
//

import SwiftUI


struct RecordButtonArmView: View {
    
    @State private var rotateRecord = false
    @State private var moveArm = false
    @State private var duration = 0.0
    
    var animateForever : Animation {
        Animation.linear(duration: duration)
            .repeatForever(autoreverses: false)
    }
    
  
    
    var body: some View {
        ZStack{
            Image("record")
                .resizable()
                .frame(width: 280, height: 280)
                .rotationEffect(Angle(degrees: rotateRecord ? 360.0 : 0.0))
                .animation(animateForever.delay(1.5), value: rotateRecord)
            Image("playerArm")
                .resizable()
                .frame(width: 150,height: 150)
                .shadow(color: .gray, radius: 2, x:0 ,y: 0)
                .rotationEffect(Angle(degrees: -35), anchor: .topTrailing)
                .rotationEffect(Angle(degrees: moveArm ? 8 : 0), anchor: .topTrailing)
                .animation(Animation.linear(duration: 1.3),value: moveArm)
                .offset(x: 75, y: -30)
            
            Button(action: {
                rotateRecord.toggle()
                moveArm.toggle()
                duration = rotateRecord ? 1.8 : 0.0
                if rotateRecord{
                    playSound(sound: "music", type: "m4a")
                }else{
                    audioPlayer?.stop()
                }
            }){HStack(){
                if !rotateRecord{
                    Text("Play").bold().foregroundColor(Color.black)
                    Image(systemName: "play.circle.fill").foregroundColor(Color.black)
                }else{
                    Text("Stop").bold().foregroundColor(Color.black)
                    Image(systemName: "stop.fill").foregroundColor(Color.red)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Capsule().strokeBorder(Color.black, lineWidth: 2.00))
            }
            .offset(x: -105, y: 135)
        }
    }
  
 
}



#Preview {
    RecordButtonArmView()
        .previewLayout(.sizeThatFits).padding()
}
