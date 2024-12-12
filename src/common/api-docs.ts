import { AppMiddleware } from "@flying-dice/tslua-http-api";
import * as spec from "../openapi.schema.json";

export const apiDocs : AppMiddleware = (req, res) => {
  res.json(spec);
}