import { AfterViewInit, Component } from '@angular/core';
import { ButtonModule } from 'primeng/button';
import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

@Component({
  selector: 'app-animation-room',
  imports: [
    ButtonModule
  ],
  templateUrl: './animation-room.component.html',
  styleUrl: './animation-room.component.scss',
  providers: [
    { provide: Window, useValue: window }
  ]
})
export class AnimationRoomComponent implements AfterViewInit {

  public isPlaying: boolean = false;
  private thisClass = this;

  constructor(private window: Window) {
    if (!this.window) {
      this.window = window;
    }
  }

  ngAfterViewInit(): void {
    this.animationRoom();
  }

  changePlayAnimation() {
    this.isPlaying = !this.isPlaying;
  }

  animationRoom() {

    const scene = new THREE.Scene();

    const camera = new THREE.PerspectiveCamera(50, window.innerWidth / window.innerHeight, 0.1, 1000);
    camera.position.set(0, 115, 100);
    camera.rotation.set(-0.75, 0, 0);

    const renderer = new THREE.WebGLRenderer({ alpha: true });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.shadowMap.enabled = true;
    renderer.setAnimationLoop(() => { animate(this.isPlaying) });
    document.getElementById('container3D')?.appendChild(renderer.domElement);

    let desktopDiorama: any;

    const loader = new GLTFLoader();
    loader.load('assets/3d models/lowpoly_desk_custom.glb',
      function (gltf) {
        desktopDiorama = gltf.scene;
        // desktopDiorama.rotation.y = -0.8;
        desktopDiorama.traverse((node: any) => {
          node.castShadow = true;
          node.receiveShadow = true;
        });
        scene.add(desktopDiorama);

      },
      function (xhr) { },
      function (error) { },
    );

    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
    scene.add(ambientLight);

    const light = new THREE.DirectionalLight(0xffffff, 2);
    light.position.set(-20, 150, 100);
    light.target.position.set(0, 20, -2);
    light.castShadow = true;
    light.shadow.mapSize.width = 1024;
    light.shadow.mapSize.height = 1024;
    light.shadow.camera.far = 230;
    light.shadow.camera.left = -80;
    light.shadow.camera.right = 80;
    light.shadow.camera.top = 80;
    light.shadow.camera.bottom = -80;
    light.shadow.bias = -0.01

    scene.add(light.target);
    scene.add(light);

    const screenMesh = new THREE.Mesh(
      new THREE.PlaneGeometry(12.35, 7.55),
      new THREE.MeshStandardMaterial({
        color: 0x000000,
        emissive: 0x66ccff,
        emissiveIntensity: 2,
      })
    );
    screenMesh.position.set(5.9, 37.47, -22.9);
    scene.add(screenMesh);

    // const helper = new THREE.CameraHelper(screenLight.shadow.camera)
    // scene.add(helper);


    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;
    controls.dampingFactor = 0.05;
    controls.zoomSpeed = 0.5;
    controls.rotateSpeed = 0.8;

    function animate(isPlaying: boolean) {
      if (desktopDiorama) {
        let isRotationFast = true;

        const maxDegree = 5.4835; // To complete 360degree
        const minDegreeToFast = 0.5;
        const maxDegreeToFast = 3.5;

        const rotationFactorSlow = 0.009;
        const rotationFactorFast = 0.1;

        isRotationFast = desktopDiorama.rotation.y >= minDegreeToFast && desktopDiorama.rotation.y <= maxDegreeToFast ? true : false;

        if (isPlaying) {
          if (desktopDiorama.rotation.y <= maxDegree) {
            desktopDiorama.rotation.y += isRotationFast ? rotationFactorFast : rotationFactorSlow;
          } else {
            desktopDiorama.rotation.y = -0.8;
          }
        }
      }
    }

    const reRender3D = () => {
      requestAnimationFrame(reRender3D);
      controls.update();
      renderer.render(scene, camera);
    }
    reRender3D();
  }
}
