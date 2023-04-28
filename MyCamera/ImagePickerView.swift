//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by 持田晴生 on 2023/04/28.
//

import SwiftUI

//構造体ImagePickerView構造体は、UIViewControllerRepresentableプロトコルに準拠している
struct ImagePickerView: UIViewControllerRepresentable {
    //UIImagePickerController(写真撮影)がされているかを管理
    @Binding var isShowSheet: Bool
    //撮影した写真を格納する変数
    @Binding var captureImage: UIImage
    
    //Coordinatorでコントローラーのdelegateを管理
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        //ImagePickerView型の定数を用意
        let parent: ImagePickerView
        
        //イニシャライザ　オブジェクトが初期化される際に呼び出される
        init(_ parent: ImagePickerView) {//parentを受け取り
            self.parent = parent
        }
        
        //撮影が終わったときに呼ばれるdelegateメソッド、必ず必要
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            //撮影した写真をcaptureに保存
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage]as? UIImage{
                parent.isShowSheet.toggle()
            }
            //sheetを閉じる
            parent.isShowSheet.toggle()
        }
        
        //キャンセルボタンが選択されたときに呼ばれdelegateメソッド、必ず必要
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            parent.isShowSheet.toggle()
        }
    }//Coordinatorここまで
    
    //Coordinatorを生成、SwiftUIによって自動的に呼び出し
    func makeCoordinator() -> Coordinator {
        //Coordinatorクラスのインスタンスを生成
        Coordinator(self)
        
        }
    //Viewを生成するときに実行
    func makeUIViewController(context: Context) -> UIImagePickerController{
        //UIImagePickerControllerのインスタンスを生成
        let myImagePickerController = UIImagePickerController()
        //sourceTypeにcameraを設定
        myImagePickerController.sourceType = .camera
        //delegate設定
        myImagePickerController.delegate = context.coordinator
        //UIImagePickerControllerを返す
        return myImagePickerController
    }
    
    //Viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //処理なし
    }
}//ImagePickerViewここまで
