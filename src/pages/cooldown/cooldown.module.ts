import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { CooldownPage } from './cooldown';

@NgModule({
  declarations: [
    CooldownPage,
  ],
  imports: [
    IonicPageModule.forChild(CooldownPage),
  ],
})
export class CooldownPageModule {}
