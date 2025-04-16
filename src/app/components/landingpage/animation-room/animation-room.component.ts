import { AfterViewInit, Component } from '@angular/core';
import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';

@Component({
  selector: 'app-animation-room',
  imports: [],
  templateUrl: './animation-room.component.html',
  styleUrl: './animation-room.component.scss',
  providers: [
    { provide: Window, useValue: window }
  ]
})
export class AnimationRoomComponent implements AfterViewInit {

  constructor(private window: Window) {
    if (!this.window) {
      this.window = window;
    }
  }

  ngAfterViewInit(): void {
    this.animationRoom();
  }

  animationRoom() {
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(10, window.innerWidth / window.innerHeight, 0.1, 1000);

    camera.position.z = 25;

    let desktopDiorama: any;

    const loader = new GLTFLoader();
    loader.load('assets/3d models/lowpoly_desk.glb',
      function (gltf) {
        desktopDiorama = gltf.scene;
        desktopDiorama.position.y = -0.5;
        desktopDiorama.rotation.y = -0.8;
        desktopDiorama.rotation.x = 0.5;
        scene.add(desktopDiorama);
      },
      function (xhr) { },
      function (error) { },
    );

    const renderer = new THREE.WebGLRenderer({ alpha: true });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setAnimationLoop(animate);
    document.getElementById('container3D')?.appendChild(renderer.domElement);

    function animate() {
      // desktopDiorama.rotation.x += 0.01;
      if (desktopDiorama) desktopDiorama.rotation.y += 0.009;
    }

    const ambientLight = new THREE.AmbientLight(0xffffff, 1.3);
    scene.add(ambientLight);

    const reRender3D = () => {
      requestAnimationFrame(reRender3D);
      renderer.render(scene, camera);
    }
    reRender3D();
  }
}
