import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, AlertController, ToastController } from 'ionic-angular';
import { TrainerDetailPage } from '../trainer-detail/trainer-detail'

@IonicPage()
@Component({
  selector: 'page-active',
  templateUrl: 'active.html',
})
export class ActivePage {

  cardz: Array< {}>;
  constructor(public navCtrl: NavController, public navParams: NavParams, public alerCtrl: AlertController, public toastCtrl: ToastController) {
    this.cardz = [
      {id: '2', name: 'Luan B.', title: '8 Bulgarian split squats with your right leg', content: 'Get a couple steps away from a heightened object, like a chair, a box or something similar. Place your left foot on said object, lower yourself until you almost touch the floor with your left knee. Then push yourself up again with the right leg. That is one Bulgarian split squat.', code: 1, isrc: "../assets/img/pushups_animation.gif", ppsrc: "assets/imgs/pp.jpg"},
      {id: '1',name: 'Luan B.', title: '5 Box Jumps', content: "Stand about two feet away from a hightend object, like a solid box, a chair or just a few stair steps. Explosively jump onto the hightened object and use as much force as possible. Then jump back down again into a crouching position. If it isn't challenging to jump to the heightened plattform, then you have to choose a migher one.",code: 2, isrc: "assets/img/stretch_animation.gif", ppsrc: "assets/imgs/pp.jpg"},
      {id: '3',name: 'Luan B.', title: '20x Calf Raises', content: 'Stand with your legs together. Lift yourself onto your toes, then lower yourself down. Move slowly to make the muscles work harder', code: 3, isrc: "assets/img/calves_animation.gif", ppsrc: "assets/imgs/pp.jpg"},
      {id: '4',name: 'Trainer D', title: '15x Squats', content: 'Place your feet hip-width apart, and keep your heels flat on the ground. Slowly lower yourself as far as you can by simply bending your knees while keeping your back erect and your neck straight. Lift back up to starting position', code: 4, isrc: "assets/img/squat_animation.gif", ppsrc: "assets/imgs/pp1.jpg"},
      {id: '5',name: 'Trainer E', title: '15x Lunges', content: 'Start in a standing position. Take a big step forward, bending your front knee. Lean your body forward with your front knee lined up vertically above your ankle. Rise back to a standing position. Alternate your legs.', code: 5, isrc: "https://i.imgur.com/Xkvlm4B.gif", ppsrc: "assets/imgs/one.jpeg"},
      {id: '6',name: 'Luan B.', title: '5 Box Jumps', content: "Stand about two feet away from a hightend object, like a solid box, a chair or just a few stair steps. Explosively jump onto the hightened object and use as much force as possible. Then jump back down again into a crouching position. If it isn't challenging to jump to the heightened plattform, then you have to choose a migher one.",code: 2, isrc: "assets/img/stretch_animation.gif", ppsrc: "assets/imgs/pp.jpg"},
    ];
  } 
  
  Done(no){
    (this.cardz).splice(no, 1);
      let toast = this.toastCtrl.create({
        message: 'Amazing, keep going!',
        duration: 2001,
        position: 'bottom'
      });
  
      toast.present(toast);
    
  };

  ionViewDidLoad() {
    console.log('ionViewDidLoad WarmupPage');
  }

  
later (no){
  var item = this.cardz[no];
  this.cardz.splice(no,1);
  this.cardz.push(item);
  let alert = this.alerCtrl.create({
    title: 'We pushed it back for you!',
    message: 'Just do it after the other exercises. <br> Keep grinding! 🏋️',
    buttons: ["Cool, I'll do it later."]
     });
    alert.present()
}
openTrainer(no){
  this.navCtrl.push(TrainerDetailPage)
}
}
