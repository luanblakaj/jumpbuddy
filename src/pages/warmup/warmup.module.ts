import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { WarmupPage } from './warmup';

@NgModule({
  declarations: [
    WarmupPage,
  ],
  imports: [
    IonicPageModule.forChild(WarmupPage),
  ],
})
export class WarmupPageModule {}
