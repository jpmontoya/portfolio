import { Component, AfterViewInit } from '@angular/core';
import { ButtonModule } from 'primeng/button';

import * as THREE from 'three';
import { PersonalInformationService } from '../../../services/shared/personal-information/personal-information.service';
import { BehaviorSubject } from 'rxjs';
import { IPersonalInformation } from '../../../interfaces/personal-information/personal-information';

@Component({
  selector: 'app-introduction',
  imports: [
    ButtonModule
  ],
  templateUrl: './introduction.component.html',
  styleUrl: './introduction.component.scss',
  providers: [
    { provide: Window, useValue: window }
  ],
})
export class IntroductionComponent implements AfterViewInit {

  public personalInformation: BehaviorSubject<IPersonalInformation | null>;

  constructor(
    private window: Window,
    private personalInformationService: PersonalInformationService
  ) {
    this.personalInformation = personalInformationService.getPersonalInformation;
  }

  ngAfterViewInit(): void {

  }

  animation() {
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);

    const renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setAnimationLoop(animate);
    document.body.appendChild(renderer.domElement);

    const geometry = new THREE.BoxGeometry(1, 1, 1);
    const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
    const cube = new THREE.Mesh(geometry, material);
    scene.add(cube);

    camera.position.z = 5;

    function animate() {

      cube.rotation.x += 0.01;
      cube.rotation.y += 0.01;

      renderer.render(scene, camera);

    }
  }

}
