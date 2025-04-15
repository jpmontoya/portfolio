import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { IPersonalInformation } from '../../../interfaces/personal-information/personal-information';
import personalInformationFile from '../../../../utils/constants/personal-information.json';

@Injectable({
  providedIn: 'root'
})
export class PersonalInformationService {

  private personalInformation: BehaviorSubject<IPersonalInformation | null> = new BehaviorSubject<IPersonalInformation | null>(null);

  constructor() {
    this.setFromFilePersonalInformation();
  }

  private setFromFilePersonalInformation() {
    this.setPersonalInformation = personalInformationFile;
  }

  set setPersonalInformation(personalInformationJson: IPersonalInformation) {
    this.personalInformation.next(personalInformationJson);
  }

  get getPersonalInformation() {
    return this.personalInformation;
  }

}
