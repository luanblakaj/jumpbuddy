import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { WeightsPage } from './weights';

@NgModule({
  declarations: [
    WeightsPage,
  ],
  imports: [
    IonicPageModule.forChild(WeightsPage),
  ],
})
export class WeightsPageModule {}
