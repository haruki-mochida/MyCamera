//
//  ContentView.swift
//  MyCamera
//
//  Created by 持田晴生 on 2023/04/28.
//

import SwiftUI

struct ContentView: View {
    //撮影した写真を保持する状態変数
    @State var captureImage: UIImage? = nil
    //撮影画面（sheet）の開閉状態を管理
    @State var isShowSheet = false
    
    var body: some View {
        VStack {
            //スペース追加
            Spacer()
            //撮影した写真があるとき
            if let captureImage{
                //撮影写真を表示
                Image(uiImage: captureImage)
                //リサイズ
                    .resizable()
                //アスペクト比（縦横比）を維持して画面に収める
                    .scaledToFit()
            }
            
            //スペース追加
            Spacer()
            //カメラを起動する　ボタン
            Button{
                //ボタンをタップしたときのアクション
                //カメラが利用可能かチェック
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    print("カメラは利用できます")
                    //カメラが使えるなら、isShowSheetをTrue
                    isShowSheet.toggle()
                }else{
                    print("カメラは利用できません")
                }
            }label: {
                //テキスト表示
                Text("カメラを起動する")
                //横幅いっぱい
                    .frame(maxWidth: .infinity)
                //高さ５０ポイントを指定
                    .frame(height: 50)
                //文字列をセンタリング指定
                    .multilineTextAlignment(.center)
                //背景を青色に指定
                 .background(Color.brown)
                //文字色を白色に指定
                    .foregroundColor(Color.white)
            }//カメラを起動するボタン　ここまで
           }//VStackここまで
    }//bodyここまで
}//ContentViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
