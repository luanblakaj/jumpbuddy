import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { TrainerDetailPage } from './trainer-detail';

@NgModule({
  declarations: [
    TrainerDetailPage,
  ],
  imports: [
    IonicPageModule.forChild(TrainerDetailPage),
  ],
})
export class TrainerDetailPageModule {}
