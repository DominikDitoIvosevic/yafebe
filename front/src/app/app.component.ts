import { Component } from '@angular/core';
import { HttpServiceService } from './http-service.service';
import 'rxjs/Rx';

interface item {
  itemId: number,
  itemText: string
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [HttpServiceService]
})
export class AppComponent {
  title = 'app works!';
  http: HttpServiceService;
  fromBackend: string = '';

  constructor(httpService: HttpServiceService){
    this.http = httpService;
    this.http.getResource('item').subscribe(r => {
      this.fromBackend = ""+r.json()[0].itemId;
    });
  }
}
