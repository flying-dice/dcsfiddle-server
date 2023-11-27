_G.print = env.info;

import { Application } from "@flying-dice/tslua-http-api";
import * as base64 from "@flying-dice/tslua-base64";
import * as spec from "./openapi.schema.json";

declare global {
  const _APP_VERSION: string;
  const _ARCHITECTURE: string;
}

export const app = new Application("127.0.0.1", 16658);

app.use("/.*", (req, res, next) => {
  res.res.headers["Access-Control-Allow-Origin"] = "*";
  next();
});

app.get("/health", (req, res) => {
  res.status(200).json({ status: "OK", _VERSION, _APP_VERSION, _ARCHITECTURE });
});

app.get("/v3/api-docs", (req, res) => {
  res.json(spec);
});

app.post("/loadstring", (req, res) => {
  if (typeof req.body !== "string") {
    res
      .status(400)
      .json({ error: "invalid body, should be base64 encoded lua string" });
    return;
  }

  const str = base64.decode(req.body as string);
  let [result] = loadstring(str);
  res.json(result && result());
});

timer.scheduleFunction(
  () => {
    try {
      app.acceptNextClient();
    } catch (e) {
      env.error(`Error accepting client: ${e}`);
    }

    return (timer.getTime() as number) + 0.1;
  },
  undefined,
  (timer.getTime() as number) + 0.1,
);
