import { Component } from '@angular/core';
import { NavController, IonicPage } from 'ionic-angular';
import { Http, Headers } from '@angular/http'
import 'rxjs/add/operator/map'
import { HttpModule } from '@angular/http'; 
@IonicPage()
@Component({
  selector: 'page-search',
  templateUrl: 'search.html'
})
export class SearchPage {
url:string;
data:string;
constructor(public http: Http,public navCtrl: NavController, HttpModule) {
}
ionViewDidLoad(){
  this.loadUser();
}
loadUser(){
  this.http.get('https://randomuser.me/api/?results=50')
  .map(res => res.json())
  .subscribe(data => {
    this.data = data.results;
    console.log(data.results);
  },err => {
    console.log(err);
  });
}
}
