import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AnimationRoomComponent } from './animation-room.component';

describe('AnimationRoomComponent', () => {
  let component: AnimationRoomComponent;
  let fixture: ComponentFixture<AnimationRoomComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AnimationRoomComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AnimationRoomComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
