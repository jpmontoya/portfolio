import { Routes } from '@angular/router';

export const routes: Routes = [
    {
        path: '',
        pathMatch: 'full',
        redirectTo: 'home'
    }, {
        path: 'home',
        loadComponent: () => import('./components/landingpage/landingpage.component').then(m => m.LandingpageComponent)
    }
];
