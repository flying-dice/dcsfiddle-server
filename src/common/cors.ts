import { AppMiddleware } from "@flying-dice/tslua-http-api";

export const cors = (origin: string = "*"): AppMiddleware => (req, res, next) => {
  res.res.headers["Access-Control-Allow-Origin"] = origin;

  if (req.method === "OPTIONS") {
    res.res.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS";
    res.res.headers["Access-Control-Allow-Headers"] = "Content-Type";
    res.res.headers["Access-Control-Max-Age"] = "86400";
    res.status(200).send("");
    return
  }

  next();
}