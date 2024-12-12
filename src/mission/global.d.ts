import { Application } from "@flying-dice/tslua-http-api";

declare global {
  let __dcs_fiddle_app: Application;
  let __dcs_fiddle_app_id: number;
}