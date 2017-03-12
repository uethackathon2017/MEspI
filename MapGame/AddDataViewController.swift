//
//  AddDataViewController.swift
//  MapGame
//
//  Created by Nguyễn Đức Tài on 3/12/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit
import RealmSwift

class AddDataViewController: UIViewController {

    let realm = try! Realm()
    public func loadData(){
        let word = Word()
        word.Id = 1
        word.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/apple.jpg?alt=media&token=ef070830-f23f-401f-af7f-9e5e8da784ed"
        word.textEng = "apple"
        word.textVn = "quả táo"
        word.des = "hoa quả"
        try! realm.write {
            realm.add(word)
        }
        
        let word2 = Word()
        word2.Id = 2
        word2.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/banana.jpeg?alt=media&token=a6749744-b0b8-44a4-9232-ef335dc8001c"
        word2.textEng = "banana"
        word2.textVn = "quả chuối"
        word2.des = "hoa quả"
        try! realm.write {
            realm.add(word2)
        }
        
        let word3 = Word()
        word3.Id = 3
        word3.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/dog.jpg?alt=media&token=ceb69a9c-1712-4e7d-8a0e-9e362bfaf8b1"
        word3.textEng = "dog"
        word3.textVn = "con chó"
        word3.des = "động vật"
        try! realm.write {
            realm.add(word3)
        }
        
        let word4 = Word()
        word4.Id = 4
        word4.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/cat.jpg?alt=media&token=688c89b7-b60a-451e-9bce-2a9517e284b1"
        word4.textEng = "cat"
        word4.textVn = "con mèo"
        word4.des = "động vật"
        try! realm.write {
            realm.add(word4)
        }
        
        let word5 = Word()
        word5.Id = 5
        word5.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/pig.jpg?alt=media&token=b6f2193b-d679-48a2-bc89-1cf7b3ff4201"
        word5.textEng = "pig"
        word5.textVn = "con lợn"
        word5.des = "động vật"
        try! realm.write {
            realm.add(word5)
        }
        
        let word6 = Word()
        word6.Id = 6
        word6.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/hand.jpg?alt=media&token=7ecc9e8b-9c12-47a3-8057-ddf3fc4afc4b"
        word6.textEng = "hand"
        word6.textVn = "cái tay"
        word6.des = "bộ phận cơ thể"
        try! realm.write {
            realm.add(word6)
        }
        
        let word7 = Word()
        word7.Id = 7
        word7.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/elephant.jpg?alt=media&token=d760ef67-fd55-4f7d-89c4-308795ce8298"
        word7.textEng = "elephant"
        word7.textVn = "con voi"
        word7.des = "động vật"
        try! realm.write {
            realm.add(word7)
        }
        
        let word8 = Word()
        word8.Id = 8
        word8.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/chicken.jpg?alt=media&token=99afb367-6529-4435-acf3-c0a47f92f8f1"
        word8.textEng = "chicken"
        word8.textVn = "con gà"
        word8.des = "động vật"
        try! realm.write {
            realm.add(word8)
        }
        
        let word9 = Word()
        word9.Id = 9
        word9.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/pig.jpg?alt=media&token=b6f2193b-d679-48a2-bc89-1cf7b3ff4201"
        word9.textEng = "pig"
        word9.textVn = "con lợn"
        word9.des = "động vật"
        try! realm.write {
            realm.add(word9)
        }
        
        let word10 = Word()
        word10.Id = 10
        word10.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/strawberry.png?alt=media&token=ac08cf48-886a-46e1-8812-890c8d5de688"
        word10.textEng = "strawberry"
        word10.textVn = "quả dâu"
        word10.des = "hoa quả"
        try! realm.write {
            realm.add(word10)
        }
        
        let word11 = Word()
        word11.Id = 11
        word11.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/tomato.jpg?alt=media&token=5e128df5-9aff-4d59-99e5-9da02f542686"
        word11.textEng = "tomato"
        word11.textVn = "cà chua"
        word11.des = "hoa quả"
        try! realm.write {
            realm.add(word11)
        }
        
        let word12 = Word()
        word12.Id = 12
        word12.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/papaya.jpg?alt=media&token=5124e736-0154-4b7b-b918-9a08440e83df"
        word12.textEng = "papaya"
        word12.textVn = "quả đu đủ"
        word12.des = "hoa quả"
        try! realm.write {
            realm.add(word12)
        }
        
        let word13 = Word()
        word13.Id = 13
        word13.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/orange.jpg?alt=media&token=f702262e-7355-4495-8d34-f96d4015410a"
        word13.textEng = "orange"
        word13.textVn = "quả cam"
        word13.des = "hoa quả"
        try! realm.write {
            realm.add(word13)
        }
        
        let word14 = Word()
        word14.Id = 14
        word14.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/armchair.jpeg?alt=media&token=066a4eac-2a1a-4617-a1d5-341e4540869d"
        word14.textEng = "armchair"
        word14.textVn = "ghế bành"
        word14.des = "đồ vật trong nhà"
        try! realm.write {
            realm.add(word14)
        }
        
        let word15 = Word()
        word15.Id = 15
        word15.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/chair.jpg?alt=media&token=381666ab-6991-40d8-ac40-524c557e9cf9"
        word15.textEng = "chair"
        word15.textVn = "ghế tựa"
        word15.des = "đồ vật trong nhà"
        try! realm.write {
            realm.add(word15)
        }
        
        let word16 = Word()
        word16.Id = 16
        word16.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/fridge.jpg?alt=media&token=cb960154-5c99-4315-abba-91f1dd4d11af"
        word16.textEng = "fridge"
        word16.textVn = "tủ lạnh"
        word16.des = "đồ vật trong nhà"
        try! realm.write {
            realm.add(word16)
        }
        
        let word17 = Word()
        word17.Id = 17
        word17.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/vase.png?alt=media&token=abed6c5f-cf67-420b-a9cd-df1920f304d6"
        word17.textEng = "vase"
        word17.textVn = "lọ hoa"
        word17.des = "đồ vật trong nhà"
        try! realm.write {
            realm.add(word17)
        }
        
        let word18 = Word()
        word18.Id = 18
        word18.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/pillow.jpg?alt=media&token=1e886a83-3def-41dc-acc0-820d726f432c"
        word18.textEng = "pillow"
        word18.textVn = "cái gối"
        word18.des = "đồ vật trong nhà"
        try! realm.write {
            realm.add(word18)
        }
        
        let word19 = Word()
        word19.Id = 19
        word19.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/doctor.jpg?alt=media&token=497bd113-4346-4fb7-baaf-f4b3cce3819d"
        word19.textEng = "doctor"
        word19.textVn = "bác sĩ"
        word19.des = "nghề nghiệp"
        try! realm.write {
            realm.add(word19)
        }
        
        let word20 = Word()
        word20.Id = 20
        word20.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/teacher.jpg?alt=media&token=f2b01c0c-4ea4-4b58-a407-a8b96b4aa33c"
        word20.textEng = "teacher"
        word20.textVn = "giáo viên"
        word20.des = "nghề nghiệp"
        try! realm.write {
            realm.add(word20)
        }
        
        let word21 = Word()
        word21.Id = 21
        word21.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/server.png?alt=media&token=f11f2fbd-77c9-4edd-90cf-17096e25b27c"
        word21.textEng = "server"
        word21.textVn = "phục vụ"
        word21.des = "nghề nghiệp"
        try! realm.write {
            realm.add(word21)
        }
        
        let word22 = Word()
        word22.Id = 22
        word22.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/policeman.jpg?alt=media&token=084e11cc-0187-4cfb-aef6-b817c9593929"
        word22.textEng = "policeman"
        word22.textVn = "cảnh sát"
        word22.des = "nghề nghiệp"
        try! realm.write {
            realm.add(word22)
        }
        
        let word23 = Word()
        word23.Id = 23
        word23.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/singer.jpg?alt=media&token=8de30d20-cb85-4c59-b89b-2871e70ce309"
        word23.textEng = "singer"
        word23.textVn = "ca sĩ"
        word23.des = "nghề nghiệp"
        try! realm.write {
            realm.add(word23)
        }
        
        let word24 = Word()
        word24.Id = 24
        word24.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/eraser.jpg?alt=media&token=52498675-a2ea-4353-8b2e-e667d0b003af"
        word24.textEng = "eraser"
        word24.textVn = "cái tẩy"
        word24.des = "đồ dùng học tập"
        try! realm.write {
            realm.add(word24)
        }
        
        let word25 = Word()
        word25.Id = 25
        word25.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/book.jpg?alt=media&token=c7c835ed-098b-4caf-8929-3bd9bb80e7e4"
        word25.textEng = "book"
        word25.textVn = "quyển sách"
        word25.des = "đồ dùng học tập"
        try! realm.write {
            realm.add(word25)
        }
        
        let word26 = Word()
        word26.Id = 26
        word26.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/glasses.jpg?alt=media&token=1a3562e7-c70e-41e0-adfe-1dc02e70b000"
        word26.textEng = "glasses"
        word26.textVn = "cái kính"
        word26.des = "đồ dùng học tập"
        try! realm.write {
            realm.add(word26)
        }
        
        let word27 = Word()
        word27.Id = 27
        word27.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/pencil.jpg?alt=media&token=7993d210-26ae-46ac-b053-c5b6dd226777"
        word27.textEng = "pencil"
        word27.textVn = "bút chì"
        word27.des = "đồ dùng học tập"
        try! realm.write {
            realm.add(word27)
        }
        
        let word28 = Word()
        word28.Id = 28
        word28.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/ruler.jpg?alt=media&token=5933c08a-9894-4dea-ba13-fa8eea38b399"
        word28.textEng = "ruler"
        word28.textVn = "thước"
        word28.des = "đồ dùng học tập"
        try! realm.write {
            realm.add(word28)
        }
        
        let word29 = Word()
        word29.Id = 29
        word29.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/teddy.jpg?alt=media&token=2ea29bce-61b9-487e-925a-8af2070397cf"
        word29.textEng = "teddy"
        word29.textVn = "gấu bông"
        word29.des = "đồ chơi"
        try! realm.write {
            realm.add(word29)
        }
        
        let word30 = Word()
        word30.Id = 30
        word30.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/doll.jpg?alt=media&token=af610ddd-f655-4c13-9dd0-2c7d3a0a3f80"
        word30.textEng = "doll"
        word30.textVn = "búp bê"
        word30.des = "đồ chơi"
        try! realm.write {
            realm.add(word30)
        }
        
        let word31 = Word()
        word31.Id = 31
        word31.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/balloon.jpg?alt=media&token=67cc00ed-5a72-41c8-9ec3-e497abbe6bd2"
        word31.textEng = "ballon"
        word31.textVn = "bóng bay"
        word31.des = "đồ chơi"
        try! realm.write {
            realm.add(word31)
        }
        
        let word32 = Word()
        word32.Id = 32
        word32.url = "https://firebasestorage.googleapis.com/v0/b/tai-nguyen-25f92.appspot.com/o/ball.jpg?alt=media&token=c06205df-ca8f-46bd-b66a-b757e8a807a4"
        word32.textEng = "ball"
        word32.textVn = "quả bóng"
        word32.des = "đồ chơi"
        try! realm.write {
            realm.add(word32)
        }
        let userDefaults = Foundation.UserDefaults.standard
        userDefaults.set( "OK", forKey: "CheckUploadData")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //xóa user defaults.
        let defaults = Foundation.UserDefaults.standard
        defaults.removeObject(forKey: "ID")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
