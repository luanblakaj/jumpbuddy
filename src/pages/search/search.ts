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
      {title: 'Joggeli Fitness Club Basel', address: 'Gellertstrasse 235', map:'https://www.nysc.ch/files/Bilder_Townsport/Intro_Bilder/Joggeli/joggeli_fitness_basel_04.jpg', code: 1},
      {title: 'Actifit Fitness AG', address: 'Rümelinbachweg 4', map:'https://lh5.googleusercontent.com/p/AF1QipMs9dXrceFskr5pXcHxEwTXf-_hDNksvDrcVLjC=s510-k-no', code: 2, warning: 'Women only!'},
      {title: 'World-Gym Sportstudio', address: 'Reinacherstrasse 125', map:'https://scontent.fqls1-1.fna.fbcdn.net/v/t1.0-9/15170854_903858609713849_516843602458662774_n.jpg?_nc_cat=104&_nc_ht=scontent.fqls1-1.fna&oh=405b2765ab37c21f140d6d85eca9bab9&oe=5CF9407E', code: 3},
      {title: 'Indigo Fitness Club', address: 'Sternengasse 19', map:'https://indigofitness.ch/wp-content/uploads/media/INDIGO-BS-NOORD-fitness02-t96214z8dl6syvkmp6wfeo.jpg', code: 4},
      {title: 'Fitorama AG', address: 'Lange Gasse 90', map:'https://www.fitorama.ch/fileadmin/_processed_/e/6/csm_entry_fitorama_efc_1000x600_d8857256a1.jpg', code: 5},
      {title: 'basefit.ch AG Basel Clarahuus', address: 'Teichgässlein 9', map:'https://basefit.ch/wp-content/uploads/2017/10/Header-Studio.jpg', code: 6},
      {title: 'Fitnessplus Basel Ag', address: 'Dornacherstrasse 210', map:'https://lh5.googleusercontent.com/p/AF1QipM7zTO1gyByELylg1Wtwb3EcudzIcgsPp2-KXs7=s510-k-no', code: 7},
      {title: 'City Sport + Gesundheit AG', address: 'Rebgasse 20', map:'https://www.city-gesundheit.ch/fileadmin/user_upload/City-Gesundheit/Bilder/city_tag2_033.jpg', code: 8},
      {title: 'basefit.ch Basel St. Johann', address: ' Vogesenstrasse 87', map:'https://lh3.ggpht.com/p/AF1QipPqCB8ByzzXhehY30nWeG5T8q5AeM2rltcGVdOH=s512', code: 9},
      {title: 'bodyline Dinkel & Mattioli', address: 'Missionsstrasse 52', map:'https://scontent.fqls1-1.fna.fbcdn.net/v/t31.0-8/16402489_750702268415514_7985818162056350500_o.jpg?_nc_cat=110&_nc_ht=scontent.fqls1-1.fna&oh=81b125626230d6fedb155d5d61dcce3a&oe=5CE58BD5', code: 10},

    ];
  } 
}