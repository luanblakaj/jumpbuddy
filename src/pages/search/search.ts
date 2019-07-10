import { Component } from '@angular/core';
import { NavController, IonicPage, NavParams } from 'ionic-angular';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

@IonicPage()
@Component({
  selector: 'page-search',
  templateUrl: 'search.html'
})
export class SearchPage {
  cardz: Array< {}>;
  constructor(public navCtrl: NavController, public navParams: NavParams) {
    this.cardz = [
      {title: 'Joggeli Fitness Club Basel', address: 'Gellertstrasse 235', map:'assets/img/gym/joggeli.jpg', code: 1, link: 'https://maps.app.goo.gl/PnfYL'},
      {title: 'Actifit Fitness AG', address: 'Rümelinbachweg 4', map:'assets/img/gym/actifit.jpg', code: 2, warning: 'Women only!', link: 'https://maps.app.goo.gl/cTdsj'},
      {title: 'World-Gym Sportstudio', address: 'Reinacherstrasse 125', map:'assets/img/gym/world.jpg', code: 3, link: 'https://maps.app.goo.gl/DdNj2'},
      {title: 'Indigo Fitness Club', address: 'Sternengasse 19', map:'assets/img/gym/indigo.jpg', code: 4, link: 'https://maps.app.goo.gl/7efzN'},
      {title: 'Fitorama AG', address: 'Lange Gasse 90', map:'assets/img/gym/fitorama.jpg', code: 5, link: 'https://maps.app.goo.gl/vzeko'},
      {title: 'basefit.ch AG Basel Clarahuus', address: 'Teichgässlein 9', map:'assets/img/gym/basefit.jpg', code: 6, link: 'https://maps.app.goo.gl/97AZU'},
      {title: 'Fitnessplus Basel Ag', address: 'Dornacherstrasse 210', map:'assets/img/gym/fitnessplus.jpg', code: 7, link: 'https://maps.app.goo.gl/LzJmu'},
      {title: 'City Sport + Gesundheit AG', address: 'Rebgasse 20', map:'assets/img/gym/citysport.jpg', code: 8, link: 'https://maps.app.goo.gl/JTYp7'},
      {title: 'basefit.ch Basel St. Johann', address: ' Vogesenstrasse 87', map:'assets/img/gym/basefit1.jpg', code: 9, link: 'https://maps.app.goo.gl/HbfUs'},
      {title: 'bodyline Dinkel & Mattioli', address: 'Missionsstrasse 52', map:'assets/img/gym/bodyline.jpg', code: 10, link: 'https://maps.app.goo.gl/yH1n8'},

    ];
  } 
}