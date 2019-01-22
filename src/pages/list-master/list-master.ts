import { Component } from '@angular/core';
import { IonicPage, ModalController, NavController, AlertController } from 'ionic-angular';

import { Item } from '../../models/item';
import { Items } from '../../providers';
import { WarmupPage } from '../warmup/warmup'
import { CooldownPage } from '../cooldown/cooldown';
import { WeightsPage } from '../weights/weights';
import { ActivePage } from '../active/active';

@IonicPage()
@Component({
  selector: 'page-list-master',
  templateUrl: 'list-master.html'
})
export class ListMasterPage {
  currentItems: Item[];

  constructor(public navCtrl: NavController, public items: Items, public modalCtrl: ModalController, public alerCtrl: AlertController) {
    this.currentItems = this.items.query();
    }
 
  doAlert() {
    let alert = this.alerCtrl.create({
      title: 'Reminder Set!',
      message: 'Blindtext!',
      buttons: ['Cool']
    });
    alert.present()
  }

  openWarmup(){
  this.navCtrl.push(WarmupPage)
  }
  openActive(){
  this.navCtrl.push(ActivePage)
  }
  openWeights(){
  this.navCtrl.push(WeightsPage)
  }
  openCooldown(){
  this.navCtrl.push(CooldownPage)
  }
  doRefresh(refresher) {
    
    setTimeout(() => {
      console.log('Async operation has ended');
      refresher.complete();
    }, 2000);
  }
}
