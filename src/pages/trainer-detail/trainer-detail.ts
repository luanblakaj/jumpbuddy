import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

/**
 * Generated class for the TrainerDetailPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-trainer-detail',
  templateUrl: 'trainer-detail.html',
})
export class TrainerDetailPage {

  cardz: Array< {}>;
  constructor(public navCtrl: NavController, public navParams: NavParams) {
    this.cardz = [
      {id: '2', name: 'Trainer A', title: '10x Push-Ups', content: 'Calisthenics includes basic bodyweight exercises that help build up your muscles.', code: 1, isrc: "https://www.wikihow.com/images/thumb/8/81/Increase-Your-Vertical-Leap-Step-1-Version-6.jpg/aid13874-v4-728px-Increase-Your-Vertical-Leap-Step-1-Version-6.jpg", ppsrc: "assets/imgs/a.jpeg"},
      {id: '1',name: 'Trainer B', title: 'Stretch', content: 'Focus on leg stretches, such as stretching through your heel and doing toe touches. Not only will stretching help protect your body during the rest of your workout, it will also improve your jumping abilities by loosening your muscles',code: 2, isrc: "https://i.imgur.com/bbtiwSH.gif", ppsrc: "assets/imgs/b.jpeg"},
      {id: '3',name: 'Luan B.', title: '20x Calf Raises', content: 'Stand with your legs together. Lift yourself onto your toes, then lower yourself down. Move slowly to make the muscles work harder', code: 3, isrc: "https://i.imgur.com/S9pDBNv.gif", ppsrc: "assets/imgs/pp.jpg"},
      {id: '4',name: 'Trainer D', title: '15x Squats', content: 'Place your feet hip-width apart, and keep your heels flat on the ground. Slowly lower yourself as far as you can by simply bending your knees while keeping your back erect and your neck straight. Lift back up to starting position', code: 4, isrc: "https://i.imgur.com/1v9LkYa.gif", ppsrc: "assets/imgs/pp1.jpg"},
      {id: '5',name: 'Trainer E', title: '15x Lunges', content: 'Start in a standing position. Take a big step forward, bending your front knee. Lean your body forward with your front knee lined up vertically above your ankle. Rise back to a standing position. Alternate your legs.', code: 5, isrc: "https://i.imgur.com/Xkvlm4B.gif", ppsrc: "assets/imgs/one.jpeg"}
    ];
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad TrainerDetailPage');
  }

}
