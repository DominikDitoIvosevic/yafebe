import { Observable } from 'rxjs/Rx';
import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';

@Injectable()
export class HttpServiceService {

  private rootUrl: string = "http://localhost:3000/";
  private http: Http;

  constructor(http: Http) {
    this.http = http;
  }

  public getResource(resName: string): Observable<Response> {
    return this.http.get(this.rootUrl + resName);
  }
}
