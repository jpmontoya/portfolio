import { Component } from '@angular/core';
import { ButtonModule } from 'primeng/button';
import { IntroductionComponent } from './introduction/introduction.component';

@Component({
  selector: 'app-landingpage',
  imports: [
    ButtonModule,
    IntroductionComponent
  ],
  templateUrl: './landingpage.component.html',
  styleUrl: './landingpage.component.scss'
})
export class LandingpageComponent {

}
