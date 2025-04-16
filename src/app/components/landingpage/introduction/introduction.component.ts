import { Component, AfterViewInit } from '@angular/core';
import { ButtonModule } from 'primeng/button';
import { PersonalInformationService } from '../../../services/shared/personal-information/personal-information.service';
import { BehaviorSubject } from 'rxjs';
import { IPersonalInformation } from '../../../interfaces/personal-information/personal-information';
import { AnimationRoomComponent } from '../animation-room/animation-room.component';

@Component({
  selector: 'app-introduction',
  imports: [
    ButtonModule,
    AnimationRoomComponent
  ],
  templateUrl: './introduction.component.html',
  styleUrl: './introduction.component.scss',
})

export class IntroductionComponent {

  public personalInformation: BehaviorSubject<IPersonalInformation | null>;

  constructor(
    private personalInformationService: PersonalInformationService
  ) {
    this.personalInformation = personalInformationService.getPersonalInformation;
  }

}
