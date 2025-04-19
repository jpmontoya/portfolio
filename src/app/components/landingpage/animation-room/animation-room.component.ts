import { AfterViewInit, Component } from '@angular/core';
import { ButtonModule } from 'primeng/button';
import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import { RectAreaLightHelper } from 'three/examples/jsm/helpers/RectAreaLightHelper.js';

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
  public isDaytime: boolean = true;
  public isChanging: boolean = false;
  private thisClass = this;

  constructor(private window: Window) {
    if (!this.window) {
      this.window = window;
    }
  }

  ngAfterViewInit(): void {
    this.managmentRoom();
  }

  changePlayAnimation() {
    this.isPlaying = !this.isPlaying;
  }

  createScene(): any {
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(50, window.innerWidth / window.innerHeight, 0.1, 1000);
    camera.position.set(0, 115, 100);
    camera.rotation.set(-0.75, 0, 0);

    return {
      scene,
      camera
    }
  }

  createRender(): any {
    const renderer = new THREE.WebGLRenderer({ alpha: true });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.shadowMap.enabled = true;
    document.getElementById('container3D')?.appendChild(renderer.domElement);

    return renderer;
  }

  async loadRoomModel(): Promise<any> {
    const loader = new GLTFLoader();
    const room3DModel: any = await new Promise((resolve, reject) => {
      loader.load('assets/3d models/lowpoly_desk_custom.glb',
        function (gltf) {
          resolve(gltf.scene);
        }
      );
    });

    // desktopDiorama.rotation.y = -0.8;
    room3DModel.traverse((node: any) => {
      node.castShadow = true;
      node.receiveShadow = true;
    });

    return room3DModel;
  }

  createAmbientLights(): any {
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);

    const directionalAmbientLight = new THREE.DirectionalLight(0xffffff, 2);
    directionalAmbientLight.position.set(-20, 150, 100);
    directionalAmbientLight.target.position.set(0, 20, -2);
    directionalAmbientLight.castShadow = true;
    directionalAmbientLight.shadow.mapSize.width = 1024;
    directionalAmbientLight.shadow.mapSize.height = 1024;
    directionalAmbientLight.shadow.camera.far = 230;
    directionalAmbientLight.shadow.camera.left = -80;
    directionalAmbientLight.shadow.camera.right = 80;
    directionalAmbientLight.shadow.camera.top = 80;
    directionalAmbientLight.shadow.camera.bottom = -80;
    directionalAmbientLight.shadow.bias = -0.01

    const wallLight = new THREE.RectAreaLight(0x66ccff, 5, 12.35, 5.55);
    wallLight.position.set(5.9, -20.47, -20);
    wallLight.lookAt(0, 0, -22);

    return {
      ambientLight,
      directionalAmbientLight,
      wallLight
    }
  }

  createMonitorLight(): any {
    const monitorLight = new THREE.RectAreaLight(0x66ccff, 20, 12.35, 7.55);
    monitorLight.position.set(5.9, 37.47, -22.5);
    monitorLight.lookAt(new THREE.Vector3(0, 0, 900));

    // const helper = new RectAreaLightHelper(monitorLight)
    // scene.add(helper);

    return monitorLight;
  }

  async createImageMonitor(): Promise<any> {
    let imageWall: THREE.Mesh | undefined;
    const loaderImageWall = new THREE.TextureLoader();
    await new Promise((resolve, reject) => {
      loaderImageWall.load('assets/3d models/textures/screen.png',
        function (texture) {
          const material = new THREE.MeshBasicMaterial({ map: texture });
          const geometry = new THREE.PlaneGeometry(12.35, 7.55);
          imageWall = new THREE.Mesh(geometry, material);
          imageWall.position.set(5.9, 37.47, -22.9);
          resolve(true);
        }
      );
    });
    return imageWall;
  }

  animateTurnRoom3DModel(room3DModel: any, ambientLight: THREE.AmbientLight, directionalAmbientLight: THREE.DirectionalLight, wallLight: THREE.RectAreaLight) {
    if (room3DModel) {

      let isRotationFast = true;

      const maxDegree = 5.4835; // To complete 360degree
      const minDegreeToFast = 0.5;
      const maxDegreeToFast = 3.5;

      const rotationFactorSlow = 0.009;
      const rotationFactorFast = 0.1;

      isRotationFast = room3DModel.rotation.y >= minDegreeToFast && room3DModel.rotation.y <= maxDegreeToFast ? true : false;

      if (isRotationFast && !this.isChanging) {
        this.isChanging = true;
        this.isDaytime = !this.isDaytime;
        ambientLight.intensity = this.isDaytime ? 1 : 0;
        directionalAmbientLight.intensity = this.isDaytime ? 1 : 0.06;
        wallLight.intensity = this.isDaytime ? 0 : 5;
      }
      // else {
      //   this.isChanging = false;
      // }

      if (this.isPlaying) {
        if (room3DModel.rotation.y <= maxDegree) {
          room3DModel.rotation.y += isRotationFast ? rotationFactorFast : rotationFactorSlow;
        } else {
          this.isChanging = false;
          room3DModel.rotation.y = -0.8;
        }
      }
    }
  }

  async managmentRoom() {
    const { scene, camera } = this.createScene();
    const renderer = this.createRender();

    let room3DModel: any = await this.loadRoomModel();
    scene.add(room3DModel);

    const { ambientLight, directionalAmbientLight, wallLight } = this.createAmbientLights();

    scene.add(ambientLight);
    scene.add(directionalAmbientLight.target);
    scene.add(directionalAmbientLight);
    scene.add(wallLight);

    const monitorLight = this.createMonitorLight();


    let imageWall: THREE.Mesh = await this.createImageMonitor();


    if (room3DModel) {
      room3DModel.add(imageWall);
      room3DModel.add(monitorLight);
    }

    renderer.setAnimationLoop(() => this.animateTurnRoom3DModel(room3DModel, ambientLight, directionalAmbientLight, wallLight));

    // const controls = new OrbitControls(camera, renderer.domElement);
    // controls.enableDamping = true;
    // controls.dampingFactor = 0.05;
    // controls.zoomSpeed = 0.5;
    // controls.rotateSpeed = 0.8;

    const reRender3D = () => {
      requestAnimationFrame(reRender3D);
      // controls.update();
      renderer.render(scene, camera);
    }
    reRender3D();
  }
}
